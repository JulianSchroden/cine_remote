import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/models/auto_focus_mode.dart';
import '../../../../camera_control/interface/models/camera_update_event.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

part 'actions_control_cubit.freezed.dart';

@freezed
class ActionsState with _$ActionsState {
  factory ActionsState({
    required bool isRecording,
    required AutoFocusMode focusMode,
  }) = _ActionsState;
}

@freezed
class ActionsControlState with _$ActionsControlState {
  factory ActionsControlState.init(ActionsState actionsState) = _Init;
  factory ActionsControlState.updating(ActionsState actionsState) = _Updating;
  factory ActionsControlState.updateSuccess(ActionsState actionsState) =
      _UpdateSuccess;
  factory ActionsControlState.updateFailed(ActionsState actionsState) =
      _UpdateFailed;
}

class ActionsControlCubit extends Cubit<ActionsControlState> {
  final CameraConnectionCubit _cameraConnectionCubit;
  StreamSubscription<CameraUpdateEvent>? _updateStreamSubscription;

  ActionsControlCubit(
    this._cameraConnectionCubit,
  ) : super(ActionsControlState.init(
            ActionsState(isRecording: false, focusMode: AutoFocusMode.off)));

  @override
  Future<void> close() async {
    await _updateStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    await _updateStreamSubscription?.cancel();
    _updateStreamSubscription = _cameraConnectionCubit.updateEvents.listen(
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
    await _cameraConnectionCubit.withConnectedCamera((camera) async {
      try {
        emit(ActionsControlState.updating(state.actionsState));
        await camera.triggerRecord();
      } catch (e) {
        emit(ActionsControlState.updateFailed(state.actionsState));
      }
    }, orElse: () {
      emit(ActionsControlState.updateFailed(state.actionsState));
    });
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
