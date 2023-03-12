import 'dart:io';

import 'package:cine_remote/camera_control/eos_cine_http/adapter/http_adapter_factory.dart';
import 'package:cine_remote/camera_control/eos_cine_http/adapter/http_client_factory.dart';
import 'package:cine_remote/camera_control/eos_cine_http/eos_cine_http_camera.dart';
import 'package:cine_remote/camera_control/eos_cine_http/eos_cine_http_camera_descriptor.dart';
import 'package:cine_remote/camera_control/eos_cine_http/eos_cine_http_camera_factory.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/camera_info.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/http_adapter_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../camera_control_mocks.dart';

class MockHttpClientFactory extends Mock implements HttpClientFactory {}

class MockHttpAdapterFactory extends Mock implements HttpAdapterFactory {}

void main() {
  const okResponseBody = '{"res":"ok"}';
  final authCookie = Cookie('acid', 'e3d4');

  late MockHttpClient mockHttpClient;
  late MockHttpClientFactory mockHttpClientFactory;
  late MockHttpAdapter mockHttpAdapter;
  late MockHttpAdapterFactory mockHttpAdapterFactory;
  late MockActionFactory mockActionFactory;

  late EosCineHttpCameraFactory sut;

  setUp(() {
    registerFallbackValue(MockHttpClient());
    registerFallbackValue(MockHttpAdapter());

    mockHttpClient = MockHttpClient();
    mockHttpClientFactory = MockHttpClientFactory();
    when(() => mockHttpClientFactory.create())
        .thenAnswer((_) => Future.value(mockHttpClient));

    mockHttpAdapter = MockHttpAdapter();
    mockHttpAdapterFactory = MockHttpAdapterFactory();
    when(() => mockHttpAdapterFactory.create(any(), any()))
        .thenAnswer((_) async => mockHttpAdapter);

    final mockLoginAction = MockLoginAction();
    when(() => mockLoginAction.call()).thenAnswer((_) async =>
        HttpAdapterResponse(
            statusCode: 200, jsonBody: okResponseBody, cookies: [authCookie]));
    final mockGetInfo = MockGetInfoAction();
    when(() => mockGetInfo.call()).thenAnswer(
        (_) async => const CameraInfo(language: 0, productId: 'VKIX00'));

    mockActionFactory = MockActionFactory();
    when(() => mockActionFactory.createLoginAction(any()))
        .thenReturn(mockLoginAction);

    when(() => mockActionFactory.createGetInfoAction(any()))
        .thenReturn(mockGetInfo);

    sut = EosCineHttpCameraFactory(
        mockHttpClientFactory, mockHttpAdapterFactory, mockActionFactory);
  });

  test('uses ClientFactory to create new client', () async {
    await sut.connect(EosCineHttpCameraDescriptor());

    verify(() => mockHttpClientFactory.create()).called(1);
  });

  test('uses AdapterFactory to create new adapter and passes client along',
      () async {
    await sut.connect(EosCineHttpCameraDescriptor());

    verify(() => mockHttpAdapterFactory.create(mockHttpClient, any()));
  });

  test('calls login action to get auth cookie', () async {
    await sut.connect(EosCineHttpCameraDescriptor());

    verify(() => mockActionFactory.createLoginAction(mockHttpAdapter))
        .called(1);
    verify(() => mockHttpAdapter.addCookies(
          any(
            that: contains(
              predicate<Cookie>((c) => c.name == 'acid' && c.value == 'e3d4'),
            ),
          ),
        ));
  });

  test('calls getInfo action to get productId and brlang cookie values',
      () async {
    await sut.connect(EosCineHttpCameraDescriptor());

    verify(() => mockActionFactory.createGetInfoAction(mockHttpAdapter));
    verify(() => mockHttpAdapter.addCookies(
          any(
            that: containsAll([
              predicate<Cookie>(
                  (c) => c.name == 'productId' && c.value == 'VKIX00'),
              predicate<Cookie>((c) => c.name == 'brlang' && c.value == '0'),
            ]),
          ),
        ));
  });

  test('returns EosCineHttpCamera instance', () async {
    final camera = await sut.connect(EosCineHttpCameraDescriptor());

    expect(camera, isA<EosCineHttpCamera>());
  });
}