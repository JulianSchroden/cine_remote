import 'dart:convert';

import 'package:cine_remote/camera_control/eos_cine_http/communication/actions/set_prop_action.dart';
import 'package:cine_remote/camera_control/eos_cine_http/constants/api_endpoint_path.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/eos_cine_prop_value.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/http_adapter_response.dart';
import 'package:cine_remote/camera_control/interface/exceptions/unsupported_prop_exception.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../camera_control_mocks.dart';

void main() {
  late MockHttpAdapter mockHttpAdapter;

  setUp(() {
    mockHttpAdapter = MockHttpAdapter();
  });

  test('sets iso value', () async {
    when(
      () => mockHttpAdapter.get(ApiEndpointPath.setProp, {'gcv': '1250'}),
    ).thenAnswer((_) async => HttpAdapterResponse(
          statusCode: 200,
          jsonBody: jsonDecode('{"res":"ok"}'),
          cookies: [],
        ));

    await SetPropAction(mockHttpAdapter, ControlPropType.iso,
            const EosCinePropValue('1250'))
        .call();
  });

  test('throws when trying to set unsupported propType', () {
    act() => SetPropAction(mockHttpAdapter, ControlPropType.shutterSpeed,
            const EosCinePropValue('1/50'))
        .call();

    expect(act, throwsA(isA<UnsupportedPropException>()));
  });
}
