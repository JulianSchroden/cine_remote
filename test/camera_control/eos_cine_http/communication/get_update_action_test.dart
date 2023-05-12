import 'dart:convert';

import 'package:cine_remote/camera_control/eos_cine_http/communication/actions/get_update_action.dart';
import 'package:cine_remote/camera_control/eos_cine_http/constants/api_endpoint_path.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/eos_cine_prop_value.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/http_adapter_response.dart';
import 'package:cine_remote/camera_control/interface/exceptions/camera_communication_exception.dart';
import 'package:cine_remote/camera_control/interface/models/properties/auto_focus_mode.dart';
import 'package:cine_remote/camera_control/interface/models/camera_update_event.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../camera_control_mocks.dart';

void main() {
  late MockHttpAdapter mockHttpAdapter;

  setUp(() {
    mockHttpAdapter = MockHttpAdapter();
  });

  void setupGetProp(int sequence, int statusCode, String body) {
    when(() => mockHttpAdapter
            .get(ApiEndpointPath.getUpdate, {'seq': sequence.toString()}))
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
    setupGetProp(0, 200, getUpdateResponse);

    final updateResponse = await GetUpdateAction(mockHttpAdapter, 0).call();
    expect(updateResponse.cameraEvents, []);
  });

  test('should update counter when response contains new sequence number',
      () async {
    const getUpdateResponse = '{"res":"ok","seq":3,"com":1}';
    setupGetProp(0, 200, getUpdateResponse);

    final response = await GetUpdateAction(mockHttpAdapter, 0).call();
    expect(response.updateSequnce, 3);
    expect(response.cameraEvents, []);
  });

  test('should throw when statusCode is not okay', () async {
    setupGetProp(0, 404, '{}');

    expect(GetUpdateAction(mockHttpAdapter, 0).call(),
        throwsA(isA<CameraCommunicationException>()));
  });

  test('should throw when res field is not okay', () async {
    setupGetProp(0, 200, '{"res":"rootredirect"}');

    expect(GetUpdateAction(mockHttpAdapter, 0).call(),
        throwsA(isA<CameraCommunicationException>()));
  });

  group('recordState', () {
    test(
        'should add recordState event with isRecording true when rec state equals Rec',
        () async {
      const updateResponse =
          ' {"res":"ok","seq":41,"rec":"Rec","com":2,"tc":"02:27:17:10"}';
      setupGetProp(40, 200, updateResponse);

      final response = await GetUpdateAction(mockHttpAdapter, 40).call();
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
      setupGetProp(40, 200, updateResponse);

      final response = await GetUpdateAction(mockHttpAdapter, 40).call();
      expect(
        response.cameraEvents,
        contains(const CameraUpdateEvent.recordState(false)),
      );
    });
  });

  group('nd filter', () {
    test('should add ndFilter event with correct value', () async {
      const updateResponse = '{"res":"ok","seq":2,"com":10,"nd":2}';
      setupGetProp(1, 200, updateResponse);

      final response = await GetUpdateAction(mockHttpAdapter, 1).call();
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
      setupGetProp(7, 200, updateResponse);

      final response = await GetUpdateAction(mockHttpAdapter, 7).call();
      expect(
        response.cameraEvents,
        contains(const CameraUpdateEvent.propValueChanged(
            ControlPropType.iso, EosCinePropValue('4000'))),
      );
    });

    test('should add prop event with updated aperture value', () async {
      const updateResponse =
          '{"res":"ok","seq":6,"com":2,"cbtn":"f0i1af4ai1fm1","Oav":{"pv":"2.2","en":1},"Oam":{"pv":"Manual","en":0}}';
      setupGetProp(5, 200, updateResponse);

      final response = await GetUpdateAction(mockHttpAdapter, 5).call();
      expect(
        response.cameraEvents,
        contains(const CameraUpdateEvent.propValueChanged(
            ControlPropType.aperture, EosCinePropValue('2.2'))),
      );
    });

    test('should add prop event with updated shutter angle value', () async {
      const updateResponse =
          '{"res":"ok","seq":9,"com":3,"Ossm":{"pv":"angle","en":1},"Ossv":{"pv":"240.00","en":1}}';
      setupGetProp(8, 200, updateResponse);

      final response = await GetUpdateAction(mockHttpAdapter, 8).call();
      expect(
        response.cameraEvents,
        contains(const CameraUpdateEvent.propValueChanged(
            ControlPropType.shutterAngle, EosCinePropValue('240.00'))),
      );
    });

    test('should add prop event with updated white balance value', () async {
      const updateResponse =
          '{"res":"ok","seq":27,"com":5,"Owbm":{"pv":"Kelvin","en":1},"Owbv":{"pv":"4100","en":1}}';
      setupGetProp(26, 200, updateResponse);

      final response = await GetUpdateAction(mockHttpAdapter, 26).call();
      expect(
        response.cameraEvents,
        contains(const CameraUpdateEvent.propValueChanged(
            ControlPropType.whiteBalance, EosCinePropValue('4100'))),
      );
    });
  });

  group('autoFocusMode', () {
    test('Should set autoFocusMode to off', () async {
      const updateResponse =
          '{"res":"ok","seq":8,"com":10,"cbtn":"f0i1af3ai1fm1","fframe":"off"}';
      setupGetProp(7, 200, updateResponse);

      final response = await GetUpdateAction(mockHttpAdapter, 7).call();
      expect(
        response.cameraEvents,
        contains(const CameraUpdateEvent.focusMode(AutoFocusMode.off)),
      );
    });

    test('Should set autoFocusMode to oneShot', () async {
      const updateResponse =
          '{"res":"ok","seq":14,"com":8,"cbtn":"f1i1af1ai1fm1","fframe":"off"}';
      setupGetProp(13, 200, updateResponse);

      final response = await GetUpdateAction(mockHttpAdapter, 13).call();
      expect(
        response.cameraEvents,
        contains(const CameraUpdateEvent.focusMode(AutoFocusMode.oneShot)),
      );
    });

    test('Should set autoFocusMode to continues', () async {
      const updateResponse =
          '{"res":"ok","seq":13,"com":1,"cbtn":"f0i1af4ai1fm1","fframe":"contin"}';
      setupGetProp(12, 200, updateResponse);

      final response = await GetUpdateAction(mockHttpAdapter, 12).call();
      expect(
        response.cameraEvents,
        contains(const CameraUpdateEvent.focusMode(AutoFocusMode.continues)),
      );
    });
  });
}
