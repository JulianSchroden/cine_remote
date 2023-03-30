import 'dart:convert';

import 'package:cine_remote/camera_control/eos_cine_http/communication/actions/get_prop_action.dart';
import 'package:cine_remote/camera_control/eos_cine_http/constants/api_endpoint_path.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/eos_cine_prop_value.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/http_adapter_response.dart';
import 'package:cine_remote/camera_control/interface/exceptions/unsupported_prop_exception.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../camera_control_mocks.dart';

void main() {
  late MockHttpAdapter mockHttpAdapter;

  setUp(() {
    mockHttpAdapter = MockHttpAdapter();
  });

  test('should get iso prop', () async {
    const getIsoResponseBody =
        '{"res":"ok","Ogcv":{"pv":"[850]","en":1,"rvn":27,"rv":["640","800","[850]","1000","1250"]}}';

    when(
      () => mockHttpAdapter.get(ApiEndpointPath.getProp, {'r': 'gcv'}),
    ).thenAnswer((_) async => HttpAdapterResponse(
          statusCode: 200,
          jsonBody: jsonDecode(getIsoResponseBody),
          cookies: [],
        ));

    final result =
        await GetPropAction(mockHttpAdapter, ControlPropType.iso).call();
    expect(
      result,
      ControlProp(
          type: ControlPropType.iso,
          currentValue: const EosCinePropValue('[850]'),
          allowedValues: ['640', '800', '[850]', '1000', '1250']
              .map((value) => EosCinePropValue(value))
              .toList()),
    );
  });

  test('should get aperture prop', () async {
    const getApertureResponseBody =
        '{"res":"ok","Oav":{"pv":"2.8","en":1,"rvn":22,"rv":["2.8","3.2","3.5","4.0","4.5","5.0"]}}';

    when(
      () => mockHttpAdapter.get(ApiEndpointPath.getProp, {'r': 'av'}),
    ).thenAnswer((_) async => HttpAdapterResponse(
          statusCode: 200,
          jsonBody: jsonDecode(getApertureResponseBody),
          cookies: [],
        ));

    final result =
        await GetPropAction(mockHttpAdapter, ControlPropType.aperture).call();
    expect(
      result,
      ControlProp(
          type: ControlPropType.aperture,
          currentValue: const EosCinePropValue('2.8'),
          allowedValues: ['2.8', '3.2', '3.5', '4.0', '4.5', '5.0']
              .map((value) => EosCinePropValue(value))
              .toList()),
    );
  });

  test('should get shutter angle prop', () async {
    const getShutterAngleResponseBody =
        '{"res":"ok","Ossv":{"pv":"180.00","en":1,"rvn":14,"rv":["360.00","300.00","240.00","180.00"]}}';

    when(
      () => mockHttpAdapter.get(ApiEndpointPath.getProp, {'r': 'ssv'}),
    ).thenAnswer((_) async => HttpAdapterResponse(
          statusCode: 200,
          jsonBody: jsonDecode(getShutterAngleResponseBody),
          cookies: [],
        ));

    final result =
        await GetPropAction(mockHttpAdapter, ControlPropType.shutterAngle)
            .call();
    expect(
        result,
        ControlProp(
            type: ControlPropType.shutterAngle,
            currentValue: const EosCinePropValue('180.00'),
            allowedValues: ['360.00', '300.00', '240.00', '180.00']
                .map((value) => EosCinePropValue(value))
                .toList()));
  });

  test('should get white balance prop', () async {
    const getWhiteBalanceResponseBody =
        '{"res":"ok","Owbv":{"pv":"5600","en":1,"rvn":131,"rv":["5400","5500","5600","5700","5800","5900"]}}';

    when(
      () => mockHttpAdapter.get(ApiEndpointPath.getProp, {'r': 'wbv'}),
    ).thenAnswer((_) async => HttpAdapterResponse(
          statusCode: 200,
          jsonBody: jsonDecode(getWhiteBalanceResponseBody),
          cookies: [],
        ));

    final result =
        await GetPropAction(mockHttpAdapter, ControlPropType.whiteBalance)
            .call();
    expect(
      result,
      ControlProp(
          type: ControlPropType.whiteBalance,
          currentValue: const EosCinePropValue('5600'),
          allowedValues: ['5400', '5500', '5600', '5700', '5800', '5900']
              .map((value) => EosCinePropValue(value))
              .toList()),
    );
  });

  test('throws when trying to get unsupported prop', () {
    act() =>
        GetPropAction(mockHttpAdapter, ControlPropType.shutterSpeed).call();

    expect(act, throwsA(isA<UnsupportedPropException>()));
  });
}
