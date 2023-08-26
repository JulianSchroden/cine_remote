import 'package:bloc_test/bloc_test.dart';
import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:cine_remote/presentation/features/camera_control/bloc/camera_meta_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

void main() {
  late MockCameraConnectionCubit mockCameraConnectionCubit;
  late MockCamera mockCamera;
  late CameraDescriptor cameraDescriptor;

  setUp(() {
    mockCameraConnectionCubit = MockCameraConnectionCubit();
    mockCamera = MockCamera();
    mockCameraConnectionCubit.setupCameraConnected(mockCamera);

    cameraDescriptor = const CameraDescriptor(
        mode: PhotoMode(ExposureMode.manual), capabilities: []);
  });

  group('init', () {
    blocTest<CameraMetaCubit, CameraMetaState>(
      'emits [initInProgress, updateSuccess] on success',
      setUp: () {
        mockCamera.setupDescriptor(
          mode: cameraDescriptor.mode,
          capabilities: cameraDescriptor.capabilities,
        );
      },
      build: () => CameraMetaCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.init(),
      expect: () => [
        const CameraMetaState.initInProgress(),
        CameraMetaState.updateSuccess(cameraDescriptor),
      ],
    );

    blocTest<CameraMetaCubit, CameraMetaState>(
      'emits [initInProgress, error] when loading descriptor fails',
      setUp: () {
        when(() => mockCamera.getDescriptor()).thenThrow(Error());
      },
      build: () => CameraMetaCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.init(),
      expect: () => const [
        CameraMetaState.initInProgress(),
        CameraMetaState.error(),
      ],
    );

    blocTest<CameraMetaCubit, CameraMetaState>(
      'emits [initInProgress, error] when camera not connected',
      setUp: () {
        mockCameraConnectionCubit.setupCameraDisconnected();
      },
      build: () => CameraMetaCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.init(),
      expect: () => const [
        CameraMetaState.initInProgress(),
        CameraMetaState.error(),
      ],
    );
  });
}
