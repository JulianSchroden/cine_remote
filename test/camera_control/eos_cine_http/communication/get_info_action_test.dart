import 'dart:convert';

import 'package:cine_remote/camera_control/eos_cine_http/communication/actions/get_info_action.dart';
import 'package:cine_remote/camera_control/eos_cine_http/constants/api_endpoint_path.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/camera_info.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/http_adapter_response.dart';
import 'package:cine_remote/camera_control/interface/exceptions/camera_communication_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../camera_control_mocks.dart';

void main() {
  late MockHttpAdapter mockHttpAdapter;

  setUp(() {
    mockHttpAdapter = MockHttpAdapter();
  });

  test('should throw when response is not okay', () {
    final mockResponse = MockHttpAdapterResponse();
    when(() => mockResponse.isOkay()).thenReturn(false);
    when(() => mockHttpAdapter.get(ApiEndpointPath.getInfo))
        .thenAnswer((_) async => mockResponse);

    expect(GetInfoAction(mockHttpAdapter).call(),
        throwsA(isA<CameraCommunicationException>()));
  });

  test('should map response to model', () async {
    const getInfoResponse =
        '{"res":"ok","modelName":"","manufacturer":"","serialNum":"","lang":0,"mode":1,"productId":"VKIX00"}';
    when(() => mockHttpAdapter.get(ApiEndpointPath.getInfo)).thenAnswer(
        (_) async => HttpAdapterResponse(
            statusCode: 200,
            jsonBody: jsonDecode(getInfoResponse),
            cookies: []));

    final response = await GetInfoAction(mockHttpAdapter).call();
    expect(response, const CameraInfo(language: 0, productId: 'VKIX00'));
  });
}
