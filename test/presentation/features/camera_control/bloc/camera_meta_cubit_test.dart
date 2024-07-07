import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:cine_remote/presentation/features/camera_control/bloc/camera_meta_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';
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
    when(() => mockCameraConnectionCubit.updateEvents)
        .thenAnswer((_) => Stream.fromIterable([]));
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

  group('update handling', () {
    setUp(() {
      mockCamera.setupDescriptor(
        mode: cameraDescriptor.mode,
        capabilities: cameraDescriptor.capabilities,
      );
    });

    BlocTestStep<CameraMetaCubit,
            CameraMetaState, StreamController<CameraUpdateEvent>>
        initStep() => BlocTestStep(
              'init handling',
              act: (bloc, streamController) {
                bloc.init();
              },
              expect: () => [
                const CameraMetaState.initInProgress(),
                CameraMetaState.updateSuccess(cameraDescriptor),
              ],
            );

    StreamController<CameraUpdateEvent> setupStreamController() {
      final updateStreamController = StreamController<CameraUpdateEvent>();
      when(() => mockCameraConnectionCubit.updateEvents)
          .thenAnswer((_) => updateStreamController.stream);
      return updateStreamController;
    }

    multiStepBlocTest<CameraMetaCubit, CameraMetaState,
        StreamController<CameraUpdateEvent>>(
      'when stream emits other event',
      setUp: setupStreamController,
      build: () => CameraMetaCubit(mockCameraConnectionCubit),
      steps: [
        initStep(),
        BlocTestStep(
          'ignores event and emits nothing',
          act: (bloc, streamController) {
            streamController.add(const CameraUpdateEvent.recordState(true));
          },
          expect: () => [],
        ),
      ],
    );

    multiStepBlocTest<CameraMetaCubit, CameraMetaState,
        StreamController<CameraUpdateEvent>>(
      'when stream emits descriptorChanged event',
      setUp: setupStreamController,
      build: () => CameraMetaCubit(mockCameraConnectionCubit),
      steps: [
        initStep(),
        BlocTestStep(
          'emits [updateSuccess] with updated descriptor',
          act: (bloc, streamController) {
            streamController.add(
              const CameraUpdateEvent.descriptorChanged(
                CameraDescriptor(
                  mode: CameraMode.video(ExposureMode.shutterPriority),
                  capabilities: [],
                ),
              ),
            );
          },
          expect: () => [
            const CameraMetaState.updateSuccess(
              CameraDescriptor(
                mode: CameraMode.video(ExposureMode.shutterPriority),
                capabilities: [],
              ),
            )
          ],
        ),
      ],
    );

    multiStepBlocTest<CameraMetaCubit, CameraMetaState,
        StreamController<CameraUpdateEvent>>(
      'when stream emits error',
      setUp: setupStreamController,
      build: () => CameraMetaCubit(mockCameraConnectionCubit),
      steps: [
        initStep(),
        BlocTestStep(
          'emits [error]',
          act: (bloc, streamController) {
            streamController.addError(Error());
          },
          expect: () => [const CameraMetaState.error()],
        ),
      ],
    );
  });
}
