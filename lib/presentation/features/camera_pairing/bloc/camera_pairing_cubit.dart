import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/camera_factory_provider.dart';
import '../../../../camera_control/interface/discovery/discovery_handle.dart';
import '../../../../camera_control/interface/models/camera_handle.dart';
import '../../recent_cameras/repository/recent_cameras_repository.dart';

part 'camera_pairing_cubit.freezed.dart';

@freezed
class CameraPairingState with _$CameraPairingState {
  const factory CameraPairingState.init() = _Init;
  const factory CameraPairingState.active(DiscoveryHandle discoveryHandle) =
      _Activ;
  const factory CameraPairingState.inProgress(DiscoveryHandle discoveryHandle) =
      _InProgress;
  const factory CameraPairingState.success(CameraHandle cameraHandle) =
      _Success;
  const factory CameraPairingState.error() = _Error;
}

class CameraPairingCubit extends Cubit<CameraPairingState> {
  final CameraFactoryProvider _cameraFactoryProvider;
  final RecentCamerasRepostitory _recentCamerasRepostitory;

  CameraPairingCubit(
      this._cameraFactoryProvider, this._recentCamerasRepostitory)
      : super(const CameraPairingState.init());

  void init(DiscoveryHandle discoveryHandle) {
    emit(CameraPairingState.active(discoveryHandle));
  }

  Future<void> pair(CameraHandle cameraHandle) async {
    final discoveryHandle = state.maybeWhen(
        active: (discoveryHandle) => discoveryHandle, orElse: () => null);
    if (discoveryHandle == null) {
      return;
    }

    emit(CameraPairingState.inProgress(discoveryHandle));
    try {
      final factory = _cameraFactoryProvider.provide(cameraHandle.model);
      await factory.pair(cameraHandle);
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
