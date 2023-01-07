import 'dart:convert';
import 'dart:io';

import 'package:cine_remote/data/exceptions/camera_connection_exception.dart';
import 'package:cine_remote/data/models/http_adapter_response.dart';
import 'package:cine_remote/data/models/wifi_camera_handle.dart';
import 'package:cine_remote/data/services/http_adapter.dart';
import 'package:cine_remote/data/services/wifi_camera_remote_service.dart';
import 'package:cine_remote/domain/models/control_prop.dart';
import 'package:cine_remote/domain/models/control_prop_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockHttpClientResponse extends Mock implements HttpClientResponse {}

void main() {
  late WifiCameraRemoteService sut;
  late MockHttpAdapter mockHttpAdapter;
  final WifiCameraHandle cameraHandle =
      WifiCameraHandle(cookies: [], supportedProps: []);

  setUp(() {
    mockHttpAdapter = MockHttpAdapter();
    sut = WifiCameraRemoteService(mockHttpAdapter);
  });

  group('connect', () {
    test('should throw when statusCode is not okay', () async {
      final response = HttpAdapterResponse(
        statusCode: 404,
        jsonBody: '',
        cookies: [],
      );

      when(() => mockHttpAdapter.get(null, '/api/acnt/login'))
          .thenAnswer((invocation) async => response);
      expect(() => sut.connect(), throwsA(isA<CameraConnectionException>()));
    });
  });

  group('getProp', () {
    test('should get iso prop', () async {
      const getIsoResponseBody =
          '{"res":"ok","Ogcv":{"pv":"[850]","en":1,"rvn":27,"rv":["640","800","[850]","1000","1250"]}}';

      when(() => mockHttpAdapter
              .get(cameraHandle, '/api/cam/getprop', {'r': 'gcv'}))
          .thenAnswer((_) async => HttpAdapterResponse(
                statusCode: 200,
                jsonBody: jsonDecode(getIsoResponseBody),
                cookies: [],
              ));

      final result = await sut.getProp(cameraHandle, ControlPropType.iso);
      expect(
          result,
          const ControlProp(
              type: ControlPropType.iso,
              currentValue: '[850]',
              allowedValues: ['640', '800', '[850]', '1000', '1250']));
    });

    test('should get aperture prop', () async {
      const getApertureResponseBody =
          '{"res":"ok","Oav":{"pv":"2.8","en":1,"rvn":22,"rv":["2.8","3.2","3.5","4.0","4.5","5.0"]}}';

      when(() => mockHttpAdapter
              .get(cameraHandle, '/api/cam/getprop', {'r': 'av'}))
          .thenAnswer((_) async => HttpAdapterResponse(
                statusCode: 200,
                jsonBody: jsonDecode(getApertureResponseBody),
                cookies: [],
              ));

      final result = await sut.getProp(cameraHandle, ControlPropType.aperture);
      expect(
          result,
          const ControlProp(
              type: ControlPropType.aperture,
              currentValue: '2.8',
              allowedValues: ['2.8', '3.2', '3.5', '4.0', '4.5', '5.0']));
    });

    test('should get shutter angle prop', () async {
      const getShutterAngleResponseBody =
          '{"res":"ok","Ossv":{"pv":"180.00","en":1,"rvn":14,"rv":["360.00","300.00","240.00","180.00"]}}';

      when(() => mockHttpAdapter
              .get(cameraHandle, '/api/cam/getprop', {'r': 'ssv'}))
          .thenAnswer((_) async => HttpAdapterResponse(
                statusCode: 200,
                jsonBody: jsonDecode(getShutterAngleResponseBody),
                cookies: [],
              ));

      final result =
          await sut.getProp(cameraHandle, ControlPropType.shutterAngle);
      expect(
          result,
          const ControlProp(
              type: ControlPropType.shutterAngle,
              currentValue: '180.00',
              allowedValues: ['360.00', '300.00', '240.00', '180.00']));
    });

    test('should white balance prop', () async {
      const getWhiteBalanceResponseBody =
          '{"res":"ok","Owbv":{"pv":"5600","en":1,"rvn":131,"rv":["5400","5500","5600","5700","5800","5900"]}}';

      when(() => mockHttpAdapter
              .get(cameraHandle, '/api/cam/getprop', {'r': 'wbv'}))
          .thenAnswer((_) async => HttpAdapterResponse(
                statusCode: 200,
                jsonBody: jsonDecode(getWhiteBalanceResponseBody),
                cookies: [],
              ));

      final result =
          await sut.getProp(cameraHandle, ControlPropType.whiteBalance);
      expect(
          result,
          const ControlProp(
              type: ControlPropType.whiteBalance,
              currentValue: '5600',
              allowedValues: ['5400', '5500', '5600', '5700', '5800', '5900']));
    });
  });
}
