import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/services/camera_remote_service.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

part 'actions_control_cubit.freezed.dart';

@freezed
class ActionsState with _$ActionsState {
  factory ActionsState({
    required bool isRecording,
    required bool isAfLocked,
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
  final CameraConnectionCubit cameraConnectionCubit;
  final CameraRemoteService cameraRemoteService;

  ActionsControlCubit(
    this.cameraConnectionCubit,
    this.cameraRemoteService,
  ) : super(ActionsControlState.init(
            ActionsState(isRecording: false, isAfLocked: false)));

  Future<void> triggerRecord() async {
    await cameraConnectionCubit.withConnectedCamera((cameraHandle) async {
      emit(ActionsControlState.updating(state.actionsState));
      await cameraRemoteService.triggerRecord(cameraHandle);
      emit(ActionsControlState.updateSuccess(
        state.actionsState
            .copyWith(isRecording: !state.actionsState.isRecording),
      ));
    }, orElse: () {
      ActionsControlState.updateFailed(state.actionsState);
    });
  }

  Future<void> toggleAfLock() async {
    await cameraConnectionCubit.withConnectedCamera((cameraHandle) async {
      emit(ActionsControlState.updating(state.actionsState));
      await cameraRemoteService.toggleAfLock(cameraHandle);
      emit(ActionsControlState.updateSuccess(
        state.actionsState.copyWith(isAfLocked: !state.actionsState.isAfLocked),
      ));
    }, orElse: () {
      ActionsControlState.updateFailed(state.actionsState);
    });
  }
}
