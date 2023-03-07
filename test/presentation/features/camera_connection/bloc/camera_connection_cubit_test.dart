import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/eos_cine_http_camera_handle.dart';
import 'package:cine_remote/camera_control/interface/models/camera_handle.dart';
import 'package:cine_remote/camera_control/interface/models/camera_model.dart';

import 'package:cine_remote/presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

abstract class CallbackWithCameraHandle {
  void call(CameraHandle handle);
}

class MockCallbackWithCameraHandle extends Mock
    implements CallbackWithCameraHandle {}

abstract class CallbackWithNoParams {
  void call();
}

class MockCallbackWithNoParams extends Mock implements CallbackWithNoParams {}

void main() {
  late MockDependencyHelper mockDependencyHelper;
  late MockCameraRemoteService mockCameraRemoteService;
  const cameraModel =
      CameraModel(identifier: 'C100II', name: 'Canon EOS C100 II');
  const cameraHandle = EosCineHttpCameraHandle(cookies: [], supportedProps: []);

  setUpAll(() {
    registerFallbackValue(const CameraHandle(supportedProps: []));
  });

  setUp(() {
    mockDependencyHelper = MockDependencyHelper();
    mockCameraRemoteService = MockCameraRemoteService();

    when(() => mockDependencyHelper.registerCameraRemoteService(cameraModel))
        .thenReturn(mockCameraRemoteService);
  });

  blocTest<CameraConnectionCubit, CameraConnectionState>(
    'emits [initConnection, connectSuccess] when connecting to camera succeeds',
    build: () => CameraConnectionCubit(mockDependencyHelper),
    setUp: () {
      when(() => mockCameraRemoteService.connect())
          .thenAnswer((_) async => cameraHandle);
    },
    act: (cubit) => cubit.connect(cameraModel),
    expect: () => const [
      CameraConnectionState.connecting(),
      CameraConnectionState.connectionEstablished(cameraHandle)
    ],
  );

  blocTest<CameraConnectionCubit, CameraConnectionState>(
    'emits [initConnection, connectFailed] when connecting to camera fails',
    build: () => CameraConnectionCubit(mockDependencyHelper),
    setUp: () {
      when(() => mockCameraRemoteService.connect())
          .thenThrow(Exception('Cannot connect to camera'));
    },
    act: (cubit) => cubit.connect(cameraModel),
    expect: () => const [
      CameraConnectionState.connecting(),
      CameraConnectionState.connectingFailed()
    ],
  );

  group('withConnectedCamera', () {
    blocTest<CameraConnectionCubit, CameraConnectionState>(
      'calls callback with cameraHandle when connected',
      seed: () =>
          const CameraConnectionState.connectionEstablished(cameraHandle),
      build: () => CameraConnectionCubit(mockDependencyHelper),
      act: (cubit) {
        final callback = MockCallbackWithCameraHandle();
        cubit.withConnectedCamera(callback);
        verify(() => callback(cameraHandle)).called(1);
      },
    );

    blocTest<CameraConnectionCubit, CameraConnectionState>(
      'calls orElse when not connected',
      seed: () => const CameraConnectionState.connecting(),
      build: () => CameraConnectionCubit(mockDependencyHelper),
      act: (cubit) {
        final orElseCallback = MockCallbackWithNoParams();
        cubit.withConnectedCamera((handle) {}, orElse: orElseCallback);
        verify(() => orElseCallback()).called(1);
      },
    );
  });
}
