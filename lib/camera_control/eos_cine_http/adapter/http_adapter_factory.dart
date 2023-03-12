import 'dart:io';

import 'http_adapter.dart';

abstract class HttpAdapterFactory {
  const HttpAdapterFactory();

  Future<HttpAdapter> create(HttpClient client, String authority);
}

class DefaultHttpAdapterFactory extends HttpAdapterFactory {
  const DefaultHttpAdapterFactory();

  @override
  Future<HttpAdapter> create(HttpClient client, String authority) async {
    return HttpAdapter(client, authority);
  }
}
