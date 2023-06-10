import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/discovery/camera_discovery_event.dart';
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

  bool get isActive => maybeWhen(
        active: (_, __) => true,
        orElse: () => false,
      );
}

class CameraDiscoveryCubit extends Cubit<CameraDiscoveryState> {
  final CameraDiscoveryService cameraDiscoveryService;
  StreamSubscription<CameraDiscoveryEvent>? _discoveryStreamSubscription;

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

      emit(CameraDiscoveryState.active(wifiInfo.localIp, []));
    } catch (e) {
      emit(const CameraDiscoveryState.error());
    }
  }

  Future<void> startDiscovery() async {
    _discoveryStreamSubscription = cameraDiscoveryService.discover().listen(
      (discoveryEvent) async {
        final wifiInfo = await cameraDiscoveryService.wifiInfo();

        final previousHandles = state.maybeWhen(
            active: (_, discoveryHandles) => discoveryHandles,
            orElse: () => <DiscoveryHandle>[]);

        if (discoveryEvent is CameraDiscoveryEventAlive) {
          if (previousHandles.contains(discoveryEvent.handle)) {
            emit(
                CameraDiscoveryState.active(wifiInfo.localIp, previousHandles));
            return;
          }

          emit(CameraDiscoveryState.active(
              wifiInfo.localIp, [discoveryEvent.handle, ...previousHandles]));
        } else if (discoveryEvent is CameraDiscoveryEventByeBye) {
          final updatedHandles = [...previousHandles]
            ..removeWhere((handle) => handle.id == discoveryEvent.id);

          emit(CameraDiscoveryState.active(wifiInfo.localIp, updatedHandles));
        }
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
    emit(const CameraDiscoveryState.paused(null));
  }
}
