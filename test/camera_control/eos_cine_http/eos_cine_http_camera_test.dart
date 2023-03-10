import 'dart:convert';
import 'dart:io';

import 'package:cine_remote/camera_control/eos_cine_http/models/camera_info.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/http_adapter_response.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/eos_cine_http_camera_handle.dart';
import 'package:cine_remote/camera_control/interface/exceptions/camera_connection_exception.dart';
import 'package:cine_remote/camera_control/interface/models/auto_focus_mode.dart';
import 'package:cine_remote/camera_control/interface/models/camera_update_event.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop_type.dart';
import 'package:cine_remote/camera_control/eos_cine_http/services/http_adapter.dart';
import 'package:cine_remote/camera_control/eos_cine_http/eos_cine_http_camera.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockHttpAdapterResponse extends Mock implements HttpAdapterResponse {}

class MockHttpClientResponse extends Mock implements HttpClientResponse {}

void main() {
  late EosCineHttpCamera sut;
  late MockHttpAdapter mockHttpAdapter;
  const EosCineHttpCameraHandle cameraHandle = EosCineHttpCameraHandle(
    cookies: [],
    supportedProps: [],
  );

  setUp(() {
    mockHttpAdapter = MockHttpAdapter();
    sut = EosCineHttpCamera(mockHttpAdapter);
  });

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

  group('getProp', () {
    test('should get iso prop', () async {
      const getIsoResponseBody =
          '{"res":"ok","Ogcv":{"pv":"[850]","en":1,"rvn":27,"rv":["640","800","[850]","1000","1250"]}}';

      when(
        () =>
            mockHttpAdapter.get(cameraHandle, '/api/cam/getprop', {'r': 'gcv'}),
      ).thenAnswer((_) async => HttpAdapterResponse(
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

      when(
        () =>
            mockHttpAdapter.get(cameraHandle, '/api/cam/getprop', {'r': 'av'}),
      ).thenAnswer((_) async => HttpAdapterResponse(
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

      when(
        () =>
            mockHttpAdapter.get(cameraHandle, '/api/cam/getprop', {'r': 'ssv'}),
      ).thenAnswer((_) async => HttpAdapterResponse(
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

    test('should get white balance prop', () async {
      const getWhiteBalanceResponseBody =
          '{"res":"ok","Owbv":{"pv":"5600","en":1,"rvn":131,"rv":["5400","5500","5600","5700","5800","5900"]}}';

      when(
        () =>
            mockHttpAdapter.get(cameraHandle, '/api/cam/getprop', {'r': 'wbv'}),
      ).thenAnswer((_) async => HttpAdapterResponse(
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

  group('setProp', () {
    test('should set iso value', () async {
      when(
        () => mockHttpAdapter
            .get(cameraHandle, '/api/cam/setprop', {'gcv': '1250'}),
      ).thenAnswer((_) async => HttpAdapterResponse(
            statusCode: 200,
            jsonBody: jsonDecode('{"res":"ok"}'),
            cookies: [],
          ));

      await sut.setProp(cameraHandle, ControlPropType.iso, '1250');
    });
  });

  group('getUpdate', () {
    void setupGetProp(int statusCode, String body) {
      when(() => mockHttpAdapter
              .get(cameraHandle, '/api/cam/getcurprop', {'seq': '0'}))
          .thenAnswer((_) async => HttpAdapterResponse(
                statusCode: statusCode,
                jsonBody: jsonDecode(body),
                cookies: [],
              ));
    }

    test(
        'should return unchanged handle and empty list when no update data present',
        () async {
      const getUpdateResponse = '{"res":"ok","seq":0,"com":1}';
      setupGetProp(200, getUpdateResponse);

      final updateResponse = await sut.getUpdate(cameraHandle);
      expect(updateResponse.cameraHandle, cameraHandle);
      expect(updateResponse.cameraEvents, []);
    });

    test('should update counter when response contains new sequence number',
        () async {
      const getUpdateResponse = '{"res":"ok","seq":3,"com":1}';
      setupGetProp(200, getUpdateResponse);

      final response = await sut.getUpdate(cameraHandle);
      expect(
        response.cameraHandle,
        cameraHandle.copyWith(updateCounter: 3),
      );
      expect(response.cameraEvents, []);
    });

    test('should throw when statusCode is not okay', () async {
      setupGetProp(404, '{}');

      expect(sut.getUpdate(cameraHandle),
          throwsA(isA<CameraConnectionException>()));
    });

    test('should throw when res field is not okay', () async {
      setupGetProp(200, '{"res":"rootredirect"}');

      expect(sut.getUpdate(cameraHandle),
          throwsA(isA<CameraConnectionException>()));
    });

    group('recordState', () {
      test(
          'should add recordState event with isRecording true when rec state equals Rec',
          () async {
        const updateResponse =
            ' {"res":"ok","seq":41,"rec":"Rec","com":2,"tc":"02:27:17:10"}';
        setupGetProp(200, updateResponse);

        final response = await sut.getUpdate(cameraHandle);
        expect(
          response.cameraEvents,
          contains(const CameraUpdateEvent.recordState(true)),
        );
      });

      test(
          'should add recordState event with isRecording false when rec state equals Stby',
          () async {
        const updateResponse =
            ' {"res":"ok","seq":41,"rec":"Stby","com":2,"tc":"02:27:17:10"}';
        setupGetProp(200, updateResponse);

        final response = await sut.getUpdate(cameraHandle);
        expect(
          response.cameraEvents,
          contains(const CameraUpdateEvent.recordState(false)),
        );
      });
    });

    group('nd filter', () {
      test('should add ndFilter event with correct value', () async {
        const updateResponse = '{"res":"ok","seq":2,"com":10,"nd":2}';
        setupGetProp(200, updateResponse);

        final response = await sut.getUpdate(cameraHandle);
        expect(
          response.cameraEvents,
          contains(const CameraUpdateEvent.ndFilter(2)),
        );
      });
    });

    group('prop updates', () {
      test('should add prop event with updated iso value', () async {
        const updateResponse =
            '{"res":"ok","seq":8,"com":5,"Ogcm":{"pv":"iso","en":1},"Ogcv":{"pv":"4000","en":1}}';
        setupGetProp(200, updateResponse);

        final response = await sut.getUpdate(cameraHandle);
        expect(
          response.cameraEvents,
          contains(const CameraUpdateEvent.prop(ControlPropType.iso, '4000')),
        );
      });

      test('should add prop event with updated aperture value', () async {
        const updateResponse =
            '{"res":"ok","seq":6,"com":2,"cbtn":"f0i1af4ai1fm1","Oav":{"pv":"2.2","en":1},"Oam":{"pv":"Manual","en":0}}';
        setupGetProp(200, updateResponse);

        final response = await sut.getUpdate(cameraHandle);
        expect(
          response.cameraEvents,
          contains(
              const CameraUpdateEvent.prop(ControlPropType.aperture, '2.2')),
        );
      });

      test('should add prop event with updated shutter angle value', () async {
        const updateResponse =
            '{"res":"ok","seq":9,"com":3,"Ossm":{"pv":"angle","en":1},"Ossv":{"pv":"240.00","en":1}}';
        setupGetProp(200, updateResponse);

        final response = await sut.getUpdate(cameraHandle);
        expect(
          response.cameraEvents,
          contains(const CameraUpdateEvent.prop(
              ControlPropType.shutterAngle, '240.00')),
        );
      });

      test('should add prop event with updated white balance value', () async {
        const updateResponse =
            '{"res":"ok","seq":27,"com":5,"Owbm":{"pv":"Kelvin","en":1},"Owbv":{"pv":"4100","en":1}}';
        setupGetProp(200, updateResponse);

        final response = await sut.getUpdate(cameraHandle);
        expect(
          response.cameraEvents,
          contains(const CameraUpdateEvent.prop(
              ControlPropType.whiteBalance, '4100')),
        );
      });
    });

    group('autoFocusMode', () {
      test('Should set autoFocusMode to off', () async {
        const updateResponse =
            '{"res":"ok","seq":8,"com":10,"cbtn":"f0i1af3ai1fm1","fframe":"off"}';
        setupGetProp(200, updateResponse);

        final response = await sut.getUpdate(cameraHandle);
        expect(
          response.cameraEvents,
          contains(const CameraUpdateEvent.focusMode(AutoFocusMode.off)),
        );
      });

      test('Should set autoFocusMode to oneShot', () async {
        const updateResponse =
            '{"res":"ok","seq":14,"com":8,"cbtn":"f1i1af1ai1fm1","fframe":"off"}';
        setupGetProp(200, updateResponse);

        final response = await sut.getUpdate(cameraHandle);
        expect(
          response.cameraEvents,
          contains(const CameraUpdateEvent.focusMode(AutoFocusMode.oneShot)),
        );
      });

      test('Should set autoFocusMode to continues', () async {
        const updateResponse =
            '{"res":"ok","seq":13,"com":1,"cbtn":"f0i1af4ai1fm1","fframe":"contin"}';
        setupGetProp(200, updateResponse);

        final response = await sut.getUpdate(cameraHandle);
        expect(
          response.cameraEvents,
          contains(const CameraUpdateEvent.focusMode(AutoFocusMode.continues)),
        );
      });
    });
  });

  group('getInfo', () {
    test('should throw when response is not okay', () {
      final mockResponse = MockHttpAdapterResponse();
      when(() => mockResponse.isOkay()).thenReturn(false);
      when(() => mockHttpAdapter.get(cameraHandle, '/api/sys/getdevinfo'))
          .thenAnswer((_) async => mockResponse);

      expect(
          sut.getInfo(cameraHandle), throwsA(isA<CameraConnectionException>()));
    });

    test('should map response to model', () async {
      const getInfoResponse =
          '{"res":"ok","modelName":"","manufacturer":"","serialNum":"","lang":0,"mode":1,"productId":"VKIX00"}';
      when(() => mockHttpAdapter.get(cameraHandle, '/api/sys/getdevinfo'))
          .thenAnswer((_) async => HttpAdapterResponse(
              statusCode: 200,
              jsonBody: jsonDecode(getInfoResponse),
              cookies: []));

      final response = await sut.getInfo(cameraHandle);
      expect(response, const CameraInfo(language: 0, productId: 'VKIX00'));
    });
  });
}
