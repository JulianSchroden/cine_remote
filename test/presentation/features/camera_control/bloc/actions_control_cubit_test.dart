import 'package:bloc_test/bloc_test.dart';
import 'package:cine_remote/data/models/wifi_camera_handle.dart';
import 'package:cine_remote/presentation/features/camera_control/bloc/actions_control_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

void main() {
  late MockCameraConnectionCubit mockCameraConnectionCubit;
  late MockCameraRemoteService mockCameraRemoteService;
  const cameraHandle = WifiCameraHandle(cookies: [], supportedProps: []);

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
            ActionsState(isAfLocked: false, isRecording: false)),
      ],
    );

    blocTest<ActionsControlCubit, ActionsControlState>(
      'emits [updating, updateSuccess] when triggering record succeeds',
      setUp: () {
        mockCameraConnectionCubit.setupCameraConnected(cameraHandle);
        when(() => mockCameraRemoteService.triggerRecord(cameraHandle))
            .thenAnswer((_) async {});
      },
      build: () => ActionsControlCubit(
        mockCameraConnectionCubit,
        mockCameraRemoteService,
      ),
      act: (cubit) => cubit.triggerRecord(),
      expect: () => [
        ActionsControlState.updating(
            ActionsState(isAfLocked: false, isRecording: false)),
        ActionsControlState.updateSuccess(
            ActionsState(isAfLocked: false, isRecording: true)),
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
            ActionsState(isAfLocked: false, isRecording: false)),
        ActionsControlState.updateFailed(
            ActionsState(isAfLocked: false, isRecording: false)),
      ],
    );
  });
}
