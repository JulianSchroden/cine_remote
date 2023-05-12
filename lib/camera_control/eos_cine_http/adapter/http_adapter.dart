import 'dart:async';
import 'dart:io';

import '../../interface/exceptions/camera_communication_exception.dart';
import '../extensions/client_response_extensions.dart';
import '../models/http_adapter_response.dart';

class HttpAdapter {
  final HttpClient _client;
  final String _authority;
  final List<Cookie> _cookies = [];
  bool _isClosed = false;

  HttpAdapter(this._client, this._authority);

  Future<void> close() async {
    _client.close();
    _isClosed = true;
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
    Duration timeLimit = const Duration(seconds: 2),
  ]) async {
    if (_isClosed) {
      throw const CameraCommunicationAbortedException(
          'Failed to send request. Client  is closed');
    }

    try {
      final url = Uri.http(_authority, path, queryParams);
      final request = await _client.getUrl(url).timeout(timeLimit);
      request.cookies.addAll(_cookies);

      return request.close().timeout(timeLimit);
    } catch (e) {
      if (e is SocketException || e is TimeoutException) {
        throw const CameraCommunicationAbortedException(
            'Failed to send request');
      }

      rethrow;
    }
  }

  void addCookies(List<Cookie> cookies) {
    _cookies.addAll(cookies);
  }
}
