import 'dart:io';

import 'http_adapter.dart';

abstract class HttpAdaperFactory {
  const HttpAdaperFactory();

  Future<HttpAdapter> create(HttpClient client, String authority);
}

class DefaultHttpAdapterFactory extends HttpAdaperFactory {
  const DefaultHttpAdapterFactory();

  @override
  Future<HttpAdapter> create(HttpClient client, String authority) async {
    return HttpAdapter(client, authority);
  }
}
