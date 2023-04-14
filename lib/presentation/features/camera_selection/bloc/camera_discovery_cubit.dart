import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/discovery/camera_discovery_service.dart';
import '../../../../camera_control/interface/discovery/discovery_handle.dart';

part 'camera_discovery_cubit.freezed.dart';

@freezed
class CameraDiscoveryState with _$CameraDiscoveryState {
  const CameraDiscoveryState._();

  const factory CameraDiscoveryState.init() = _Init;
  const factory CameraDiscoveryState.initInProgress() = _InitInProgress;
  const factory CameraDiscoveryState.active(
      String? currentIp, List<DiscoveryHandle> discoveryHandles) = _Active;
  const factory CameraDiscoveryState.paused(String? currentIp) = _Paused;
  const factory CameraDiscoveryState.error() = _Error;

  String? get currentIp => maybeWhen(
        paused: (currentIp) => currentIp,
        active: (currentIp, _) => currentIp,
        orElse: () => null,
      );
}

class CameraDiscoveryCubit extends Cubit<CameraDiscoveryState> {
  final CameraDiscoveryService cameraDiscoveryService;
  StreamSubscription<DiscoveryHandle>? _discoveryStreamSubscription;

  CameraDiscoveryCubit(this.cameraDiscoveryService)
      : super(const CameraDiscoveryState.init());

  @override
  Future<void> close() async {
    await _discoveryStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    emit(const CameraDiscoveryState.initInProgress());

    try {
      final wifiInfo = await cameraDiscoveryService.wifiInfo();
      await startDiscovery();

      emit(CameraDiscoveryState.paused(wifiInfo.localIp));
    } catch (e) {
      emit(const CameraDiscoveryState.error());
    }
  }

  Future<void> startDiscovery() async {
    _discoveryStreamSubscription = cameraDiscoveryService.discover().listen(
      (discoveredCamera) async {
        final wifiInfo = await cameraDiscoveryService.wifiInfo();

        final previousHandles = state.maybeWhen(
            active: (_, discoveryHandles) => discoveryHandles,
            orElse: () => <DiscoveryHandle>[]);

        if (previousHandles.contains(discoveredCamera)) {
          emit(CameraDiscoveryState.active(wifiInfo.localIp, previousHandles));
          return;
        }

        emit(CameraDiscoveryState.active(
            wifiInfo.localIp, [discoveredCamera, ...previousHandles]));
      },
      onError: (e, s) {
        emit(const CameraDiscoveryState.error());
      },
      onDone: () async {
        final wifiInfo = await cameraDiscoveryService.wifiInfo();
        emit(CameraDiscoveryState.paused(wifiInfo.localIp));
      },
    );
  }

  Future<void> stopDiscovery() async {
    await _discoveryStreamSubscription?.cancel();
  }
}
