import 'dart:io';

import '../extensions/client_response_extensions.dart';
import '../models/http_adapter_response.dart';

class HttpAdapter {
  final HttpClient _client;
  final String _authority;
  final List<Cookie> _cookies = [];

  HttpAdapter(this._client, this._authority);

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
