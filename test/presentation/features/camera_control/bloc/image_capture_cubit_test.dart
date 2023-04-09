import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/camera_control/interface/models/capabilities/image_capture_capability.dart';
import 'package:cine_remote/presentation/features/camera_control/bloc/image_capture_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

void main() {
  late MockCameraConnectionCubit mockCameraConnectionCubit;
  late MockCamera mockCamera;

  setUp(() {
    mockCameraConnectionCubit = MockCameraConnectionCubit();
    mockCamera = MockCamera();
    mockCameraConnectionCubit.setupCameraConnected(mockCamera);
  });

  group('init', () {
    blocTest<ImageCaptureCubit, ImageCaptureState>(
      'emits [initInProgress, done] when supported',
      setUp: () {
        mockCamera
            .setupDescriptor(capabilities: const [ImageCaptureCapability()]);
      },
      build: () => ImageCaptureCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.init(),
      expect: () => const [
        ImageCaptureState.initInProgess(),
        ImageCaptureState.ready(),
      ],
    );

    blocTest<ImageCaptureCubit, ImageCaptureState>(
      'emits [initInProgress, unsupported] when not supported',
      setUp: () {
        mockCamera.setupDescriptor(capabilities: []);
      },
      build: () => ImageCaptureCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.init(),
      expect: () => const [
        ImageCaptureState.initInProgess(),
        ImageCaptureState.unsupported(),
      ],
    );

    blocTest<ImageCaptureCubit, ImageCaptureState>(
      'emits [initInProgress, error] when camera not connected',
      setUp: () {
        mockCameraConnectionCubit.setupCameraDisconnected();
      },
      build: () => ImageCaptureCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.init(),
      expect: () => const [
        ImageCaptureState.initInProgess(),
        ImageCaptureState.error(),
      ],
    );
  });

  group('capture', () {
    setUp(() {
      mockCamera
          .setupDescriptor(capabilities: const [ImageCaptureCapability()]);
    });

    blocTest(
      'emits [inProgress, ready] when successful',
      setUp: () {
        when((() => mockCamera.captureImage()))
            .thenAnswer((_) => Future.value());
      },
      build: () => ImageCaptureCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.capture(),
      expect: () => const [
        ImageCaptureState.inProgress(),
        ImageCaptureState.ready(),
      ],
    );

    blocTest(
      'emits [inProgress, error] when capturing fails',
      setUp: () {
        when((() => mockCamera.captureImage())).thenThrow(Error());
      },
      build: () => ImageCaptureCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.capture(),
      expect: () => const [
        ImageCaptureState.inProgress(),
        ImageCaptureState.error(),
      ],
    );

    blocTest(
      'emits [inProgress, error] when camera not connected',
      setUp: () {
        mockCameraConnectionCubit.setupCameraDisconnected();
      },
      build: () => ImageCaptureCubit(mockCameraConnectionCubit),
      act: (bloc) => bloc.capture(),
      expect: () => const [
        ImageCaptureState.inProgress(),
        ImageCaptureState.error(),
      ],
    );
  });
}
