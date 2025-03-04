import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../recent_cameras/repository/recent_cameras_repository.dart';

part 'camera_pairing_cubit.freezed.dart';

@freezed
class CameraPairingState with _$CameraPairingState {
  const factory CameraPairingState.init() = _Init;
  const factory CameraPairingState.active(DiscoveryHandle discoveryHandle) =
      _Activ;
  const factory CameraPairingState.inProgress(DiscoveryHandle discoveryHandle) =
      _InProgress;
  const factory CameraPairingState.success(
      CameraConnectionHandle cameraHandle) = _Success;
  const factory CameraPairingState.error() = _Error;
}

class CameraPairingCubit extends Cubit<CameraPairingState> {
  final CameraControl _cameraControl;
  final RecentCamerasRepostitory _recentCamerasRepostitory;

  CameraPairingCubit(this._cameraControl, this._recentCamerasRepostitory)
      : super(const CameraPairingState.init());

  void init(DiscoveryHandle discoveryHandle) {
    emit(CameraPairingState.active(discoveryHandle));
  }

  Future<void> pair(CameraConnectionHandle cameraHandle) async {
    final discoveryHandle = state.maybeWhen(
        active: (discoveryHandle) => discoveryHandle, orElse: () => null);
    if (discoveryHandle == null) {
      return;
    }

    emit(CameraPairingState.inProgress(discoveryHandle));
    try {
      await _cameraControl.pair(cameraHandle);
      await _recentCamerasRepostitory.addCamera(cameraHandle);
      emit(CameraPairingState.success(cameraHandle));
    } catch (e) {
      emit(const CameraPairingState.error());
    }
  }

  void reset() {
    emit(const CameraPairingState.init());
  }
}
