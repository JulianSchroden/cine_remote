import 'dart:io';

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
}
