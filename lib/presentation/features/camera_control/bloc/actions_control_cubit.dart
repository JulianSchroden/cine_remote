import 'dart:async';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_camera_control_cubit.dart';

part 'actions_control_cubit.freezed.dart';

@freezed
class ActionsState with _$ActionsState {
  const factory ActionsState({
    required bool isRecording,
    required AutoFocusMode focusMode,
  }) = _ActionsState;
}

@freezed
class ActionsControlState with _$ActionsControlState {
  const factory ActionsControlState.init(ActionsState actionsState) = _Init;
  const factory ActionsControlState.updating(ActionsState actionsState) =
      _Updating;
  const factory ActionsControlState.updateSuccess(ActionsState actionsState) =
      _UpdateSuccess;
  const factory ActionsControlState.updateFailed(ActionsState actionsState) =
      _UpdateFailed;
}

class ActionsControlCubit extends BaseCameraControlCubit<ActionsControlState> {
  StreamSubscription<CameraUpdateEvent>? _updateStreamSubscription;

  ActionsControlCubit(
    super.cameraConnectionCubit, [
    super.initialState = const ActionsControlState.init(
      ActionsState(
        isRecording: false,
        focusMode: AutoFocusMode.off,
      ),
    ),
  ]);

  @override
  Future<void> close() async {
    await _updateStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    await _updateStreamSubscription?.cancel();
    _updateStreamSubscription = cameraConnectionCubit.updateEvents.listen(
      (event) {
        event.maybeWhen(
            recordState: (isRecording) {
              emit(ActionsControlState.updateSuccess(
                  state.actionsState.copyWith(isRecording: isRecording)));
            },
            focusMode: (focusMode) {
              emit(ActionsControlState.updateSuccess(
                  state.actionsState.copyWith(focusMode: focusMode)));
            },
            orElse: () {});
      },
    );
  }

  Future<void> triggerRecord() async {
    try {
      emit(ActionsControlState.updating(state.actionsState));
      await camera.triggerRecord();
    } catch (e) {
      emit(ActionsControlState.updateFailed(state.actionsState));
    }
  }

  //Future<void> toggleAfLock() async {
  //  await _cameraConnectionCubit.withConnectedCamera((cameraHandle) async {
  //    emit(ActionsControlState.updating(state.actionsState));
  //    await _cameraRemoteService.toggleAfLock(cameraHandle);
  //    emit(ActionsControlState.updateSuccess(
  //      state.actionsState.copyWith(isAfLocked: !state.actionsState.isAfLocked),
  //    ));
  //  }, orElse: () {
  //    ActionsControlState.updateFailed(state.actionsState);
  //  });
  //}
}
