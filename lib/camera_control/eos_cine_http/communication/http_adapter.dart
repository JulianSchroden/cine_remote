import 'dart:io';

import '../adapter/http_client_factory.dart';
import '../extensions/client_response_extensions.dart';
import '../models/http_adapter_response.dart';
import 'action_factory.dart';

class HttpAdapter {
  final HttpClient _client;

  static const String _authority = '192.168.0.80';
  final List<Cookie> _cookies = [];

  HttpAdapter(this._client);

  static Future<HttpAdapter> connect([
    HttpClientFactory clientFactory = const DefaultHttpClientFactory(),
    ActionFactory actionFactory = const ActionFactory(),
  ]) async {
    final client = await clientFactory.create();
    final httpAdapter = HttpAdapter(client);

    final loginAction = actionFactory.createLoginAction(httpAdapter);
    final loginResponse = await loginAction();
    httpAdapter.addCookies(loginResponse.cookies);

    final getInfoAction = actionFactory.createGetInfoAction(httpAdapter);
    final cameraInfo = await getInfoAction();
    httpAdapter.addCookies([
      Cookie('productId', cameraInfo.productId),
      Cookie('brlang', cameraInfo.language.toString()),
    ]);

    return httpAdapter;
  }

  Future<void> close() async {
    _client.close();
  }

  Future<HttpAdapterResponse> get(
    String path, [
    Map<String, dynamic>? queryParams,
  ]) async {
    return (await getRaw(path, queryParams)).toAdapterResponse();
  }

  Future<HttpClientResponse> getRaw(
    String path, [
    Map<String, dynamic>? queryParams,
  ]) async {
    final url = Uri.http(_authority, path, queryParams);
    final request = await _client.getUrl(url);
    request.cookies.addAll(_cookies);

    return await request.close();
  }

  void addCookies(List<Cookie> cookies) {
    _cookies.addAll(cookies);
  }
}
