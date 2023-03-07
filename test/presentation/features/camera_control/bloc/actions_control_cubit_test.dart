import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/camera_control/eos_cine_http/models/eos_cine_http_camera_handle.dart';
import 'package:cine_remote/camera_control/interface/models/auto_focus_mode.dart';
import 'package:cine_remote/camera_control/interface/models/camera_update_event.dart';
import 'package:cine_remote/presentation/features/camera_control/bloc/actions_control_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';
import '../../../../test_mocks.dart';

void main() {
  late MockCameraConnectionCubit mockCameraConnectionCubit;
  late MockCameraRemoteService mockCameraRemoteService;
  const cameraHandle = EosCineHttpCameraHandle(cookies: [], supportedProps: []);

  setUp(() {
    mockCameraConnectionCubit = MockCameraConnectionCubit();
    mockCameraRemoteService = MockCameraRemoteService();
  });

  group('triggerRecord', () {
    blocTest<ActionsControlCubit, ActionsControlState>(
      'emits [updateFailed] when no camera connected',
      setUp: () {
        mockCameraConnectionCubit.setupCameraDisconnected();
      },
      build: () => ActionsControlCubit(
        mockCameraConnectionCubit,
        mockCameraRemoteService,
      ),
      act: (cubit) => cubit.triggerRecord(),
      expect: () => [
        ActionsControlState.updateFailed(
            ActionsState(focusMode: AutoFocusMode.off, isRecording: false)),
      ],
    );

    multiStepBlocTest<ActionsControlCubit, ActionsControlState,
        StreamController<CameraUpdateEvent>>(
      'emits [updating, updateSuccess] when triggering record succeeds',
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
        when(() => mockCameraRemoteService.triggerRecord(cameraHandle))
            .thenAnswer((_) async {});

        final cameraUpdateStreamController =
            StreamController<CameraUpdateEvent>();
        when(() => mockCameraConnectionCubit.updateEvents)
            .thenAnswer((_) => cameraUpdateStreamController.stream);
        return cameraUpdateStreamController;
      },
      build: () => ActionsControlCubit(
        mockCameraConnectionCubit,
        mockCameraRemoteService,
      ),
      steps: [
        BlocTestStep('call init to setup stream subscription',
            act: (cubit, updateStreamController) => cubit.init(),
            expect: () => []),
        BlocTestStep(
          'emits [updating] after triggering record',
          act: (cubit, updateStreamController) => cubit.triggerRecord(),
          expect: () => [
            ActionsControlState.updating(
                ActionsState(focusMode: AutoFocusMode.off, isRecording: false)),
          ],
        ),
        BlocTestStep(
          'emits [updateSuccess] once camera reports record event',
          act: (cubit, updateStreamController) => updateStreamController
              .add(const CameraUpdateEvent.recordState(true)),
          expect: () => [
            ActionsControlState.updateSuccess(
                ActionsState(focusMode: AutoFocusMode.off, isRecording: true)),
          ],
        )
      ],
    );

    blocTest<ActionsControlCubit, ActionsControlState>(
      'emits [updating, updateFailed] when triggering record succeeds',
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
        when(() => mockCameraRemoteService.triggerRecord(cameraHandle))
            .thenThrow(() => Exception('trigger record failed'));
      },
      build: () => ActionsControlCubit(
        mockCameraConnectionCubit,
        mockCameraRemoteService,
      ),
      act: (cubit) => cubit.triggerRecord(),
      expect: () => [
        ActionsControlState.updating(
            ActionsState(focusMode: AutoFocusMode.off, isRecording: false)),
        ActionsControlState.updateFailed(
            ActionsState(focusMode: AutoFocusMode.off, isRecording: false)),
      ],
    );
  });
}
