import 'dart:convert';
import 'dart:io';

import 'package:cine_remote/camera_control/eos_cine_http/constants/api_endpoint_path.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/camera_info.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/http_adapter_response.dart';
import 'package:cine_remote/camera_control/interface/exceptions/camera_connection_exception.dart';
import 'package:cine_remote/camera_control/eos_cine_http/eos_cine_http_camera.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../camera_control_mocks.dart';

class MockHttpClientResponse extends Mock implements HttpClientResponse {}

void main() {
  late EosCineHttpCamera sut;
  late MockHttpAdapter mockHttpAdapter;

  setUp(() {
    mockHttpAdapter = MockHttpAdapter();
    sut = EosCineHttpCamera(mockHttpAdapter);
  });

  /*
  group('connect', () {
    test('should throw when statusCode is not okay', () async {
      final response = HttpAdapterResponse(
        statusCode: 404,
        jsonBody: jsonDecode('{"res":"ok"}'),
        cookies: [],
      );

      when(() => mockHttpAdapter.get(null, '/api/acnt/login'))
          .thenAnswer((invocation) async => response);
      expect(() => sut.connect(), throwsA(isA<CameraConnectionException>()));
    });

    test('should throw when res field is not okay', () async {
      final response = HttpAdapterResponse(
        statusCode: 200,
        jsonBody: jsonDecode('{"res":"busy"}'),
        cookies: [],
      );

      when(() => mockHttpAdapter.get(null, '/api/acnt/login'))
          .thenAnswer((invocation) async => response);
      expect(() => sut.connect(), throwsA(isA<CameraConnectionException>()));
    });

    test('should get camera info and set cookies accordingly', () async {
      when(() => mockHttpAdapter.get(null, '/api/acnt/login')).thenAnswer(
          (_) async => HttpAdapterResponse(
              statusCode: 200,
              jsonBody: jsonDecode('{"res":"ok"}'),
              cookies: [Cookie('acid', '7dd0')]));
      when(() =>
          mockHttpAdapter.get(any(),
              '/api/sys/getdevinfo')).thenAnswer((_) async => HttpAdapterResponse(
          statusCode: 200,
          jsonBody: jsonDecode(
              '{"res":"ok","modelName":"","manufacturer":"","serialNum":"","lang":0,"mode":1,"productId":"VKIX00"}'),
          cookies: []));

      final result = await sut.connect();
      expect(result.cookies, [
        predicate<Cookie>((c) => c.name == 'productId' && c.value == 'VKIX00'),
        predicate<Cookie>((c) => c.name == 'brlang' && c.value == '0'),
        predicate<Cookie>((c) => c.name == 'acid' && c.value == '7dd0'),
      ]);
    });
  });
  */
}
