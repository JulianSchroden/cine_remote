import 'dart:io';

import '../adapter/http_client_factory.dart';
import '../constants/api_endpoint_path.dart';
import '../extensions/client_response_extensions.dart';
import '../models/http_adapter_response.dart';

class HttpAdapter {
  final HttpClient _client;

  static const String _authority = '192.168.0.80';
  final List<Cookie> _cookies;

  const HttpAdapter(this._client, this._cookies);

  static Future<HttpAdapter> connect([
    HttpClientFactory clientFactory = const DefaultHttpClientFactory(),
  ]) async {
    final client = await clientFactory.create();
    final response = await (await _getInternal(client, ApiEndpointPath.login))
        .toAdapterResponse();

    return HttpAdapter(client, response.cookies);
  }

  Future<void> close() async {
    _client.close();
  }

  Future<HttpAdapterResponse> get(
    String path, [
    Map<String, dynamic>? queryParams,
  ]) async {
    return (await _getInternal(_client, path, _cookies, queryParams))
        .toAdapterResponse();
  }

  Future<HttpClientResponse> getRaw(
    String path, [
    Map<String, dynamic>? queryParams,
  ]) async {
    return _getInternal(_client, path, _cookies, queryParams);
  }

  static Future<HttpClientResponse> _getInternal(
    HttpClient client,
    String path, [
    List<Cookie> cookies = const [],
    Map<String, dynamic>? queryParams,
  ]) async {
    final url = Uri.http(_authority, path, queryParams);
    final request = await client.getUrl(url);
    request.cookies.addAll(cookies);

    return await request.close();
  }
}
