import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cine_remote/camera_control/eos_cine_http/adapter/http_client_factory.dart';
import 'package:cine_remote/camera_control/eos_cine_http/communication/http_adapter.dart';
import 'package:cine_remote/camera_control/eos_cine_http/constants/api_endpoint_path.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClientFactory extends Mock implements HttpClientFactory {}

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpClientRequest extends Mock implements HttpClientRequest {}

class MockHttpClientResponse extends Mock implements HttpClientResponse {}

class MockHttpSetup {
  final MockHttpClientRequest request;
  final MockHttpClientResponse response;

  const MockHttpSetup(this.request, this.response);
}

class FakeResponseTransformer extends Fake
    implements StreamTransformer<List<int>, Object?> {}

class FakeUri extends Fake implements Uri {}

void main() {
  late MockHttpClientFactory mockHttpClientFactory;
  late MockHttpClient mockHttpClient;

  setUp(() {
    registerFallbackValue(FakeUri());
    registerFallbackValue(FakeResponseTransformer());

    mockHttpClient = MockHttpClient();
    mockHttpClientFactory = MockHttpClientFactory();

    when(() => mockHttpClientFactory.create())
        .thenAnswer((_) => Future.value(mockHttpClient));
  });

  group('connect', () {
    final authCookie = Cookie('acid', 'e3d4');
    const okResponseBody = '{"res":"ok"}';
    const getInfoResponseBody =
        '{"res":"ok","modelName":"","manufacturer":"","serialNum":"","lang":0,"mode":1,"productId":"VKIX00"}';

    setUp(() {
      mockHttpClient.setUpHttpGet(
        ApiEndpointPath.login,
        200,
        okResponseBody,
        [authCookie],
      );

      mockHttpClient.setUpHttpGet(
        ApiEndpointPath.getInfo,
        200,
        getInfoResponseBody,
        [],
      );
    });

    test('calls ClientFactory to create new client', () async {
      await HttpAdapter.connect(mockHttpClientFactory);

      verify(() => mockHttpClientFactory.create()).called(1);
    });

    test('initates login', () async {
      await HttpAdapter.connect(mockHttpClientFactory);

      verify(() => mockHttpClient.getUrl(any(
          that: predicate<Uri>((uri) => uri.path == ApiEndpointPath.login))));
    });

    test('returns instance of HttpAdapter', () async {
      final result = await HttpAdapter.connect(mockHttpClientFactory);
      expect(result, isA<HttpAdapter>());
    });

    test('uses cookies from initialization for subsequent requests', () async {
      const dummyPath = '/api/dummy/path';
      final mockSetup =
          mockHttpClient.setUpHttpGet(dummyPath, 200, okResponseBody, []);

      final result = await HttpAdapter.connect(mockHttpClientFactory);
      await result.get(dummyPath);

      expect(
        mockSetup.request.cookies,
        containsAll([
          predicate<Cookie>((c) => c.name == 'acid' && c.value == 'e3d4'),
          predicate<Cookie>(
              (c) => c.name == 'productId' && c.value == 'VKIX00'),
          predicate<Cookie>((c) => c.name == 'brlang' && c.value == '0'),
        ]),
      );
    });
  });
}

extension HttpClientGetSetupExtension on MockHttpClient {
  MockHttpSetup setUpHttpGet(
    String endpointPath,
    int statusCode,
    String responseBoy,
    List<Cookie> cookies,
  ) {
    final mockResponse = MockHttpClientResponse();
    when(() => mockResponse.transform(utf8.decoder)).thenAnswer((_) {
      return Stream.fromIterable([responseBoy]);
    });
    when(() => mockResponse.statusCode).thenReturn(statusCode);
    when(() => mockResponse.cookies).thenReturn(cookies);

    final mockRequest = MockHttpClientRequest();
    when(() => mockRequest.cookies).thenReturn([]);
    when(() => mockRequest.close())
        .thenAnswer((_) => Future.value(mockResponse));

    when(() => getUrl(
            any(that: predicate<Uri>((uri) => uri.path == endpointPath))))
        .thenAnswer(
      (_) => Future.value(mockRequest),
    );

    return MockHttpSetup(mockRequest, mockResponse);
  }
}
