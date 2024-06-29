import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:cine_remote/presentation/features/camera_control/bloc/actions_control_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';
import '../../../../test_mocks.dart';

void main() {
  late MockCameraConnectionCubit mockCameraConnectionCubit;
  late MockCamera mockCamera;

  setUp(() {
    mockCameraConnectionCubit = MockCameraConnectionCubit();
    mockCamera = MockCamera();
  });

  ActionsControlCubit buildBloc() =>
      ActionsControlCubit(mockCameraConnectionCubit);

  group('triggerRecord', () {
    blocTest<ActionsControlCubit, ActionsControlState>(
      'emits [updateFailed] when no camera connected',
      build: () => buildBloc(),
      act: (cubit) => cubit.triggerRecord(),
      expect: () => const [
        ActionsControlState.updating(ActionsState(
          focusMode: AutoFocusMode.off,
          isRecording: false,
        )),
        ActionsControlState.updateFailed(ActionsState(
          focusMode: AutoFocusMode.off,
          isRecording: false,
        )),
      ],
    );

    multiStepBlocTest<ActionsControlCubit, ActionsControlState,
        StreamController<CameraUpdateEvent>>(
      'emits [updating, updateSuccess] when triggering record succeeds',
      setUp: () {
        when(() => mockCameraConnectionCubit.camera).thenReturn(mockCamera);
        when(() => mockCamera.triggerRecord()).thenAnswer((_) async {});

        final cameraUpdateStreamController =
            StreamController<CameraUpdateEvent>();
        when(() => mockCameraConnectionCubit.updateEvents)
            .thenAnswer((_) => cameraUpdateStreamController.stream);
        return cameraUpdateStreamController;
      },
      build: () => buildBloc(),
      steps: [
        BlocTestStep('call init to setup stream subscription',
            act: (cubit, updateStreamController) => cubit.init(),
            expect: () => []),
        BlocTestStep(
          'emits [updating] after triggering record',
          act: (cubit, updateStreamController) => cubit.triggerRecord(),
          expect: () => const [
            ActionsControlState.updating(ActionsState(
              focusMode: AutoFocusMode.off,
              isRecording: false,
            )),
          ],
        ),
        BlocTestStep(
          'emits [updateSuccess] once camera reports record event',
          act: (cubit, updateStreamController) => updateStreamController
              .add(const CameraUpdateEvent.recordState(true)),
          expect: () => const [
            ActionsControlState.updateSuccess(ActionsState(
              focusMode: AutoFocusMode.off,
              isRecording: true,
            )),
          ],
        )
      ],
    );

    blocTest<ActionsControlCubit, ActionsControlState>(
      'emits [updating, updateFailed] when triggering record fails',
      setUp: () {
        when(() => mockCameraConnectionCubit.camera).thenReturn(mockCamera);
        when(() => mockCamera.triggerRecord())
            .thenThrow(() => Exception('trigger record failed'));
      },
      build: () => buildBloc(),
      act: (cubit) => cubit.triggerRecord(),
      expect: () => const [
        ActionsControlState.updating(ActionsState(
          focusMode: AutoFocusMode.off,
          isRecording: false,
        )),
        ActionsControlState.updateFailed(ActionsState(
          focusMode: AutoFocusMode.off,
          isRecording: false,
        )),
      ],
    );
  });
}
