import 'dart:io';

abstract class HttpClientFactory {
  const HttpClientFactory();

  Future<HttpClient> create();
}

class DefaultHttpClientFactory implements HttpClientFactory {
  const DefaultHttpClientFactory();

  @override
  Future<HttpClient> create() async {
    return HttpClient();
  }
}
