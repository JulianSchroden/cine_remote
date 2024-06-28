import 'dart:async';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  final CameraControl cameraControl;
  final WifiInfoAdapter wifiInfoAdapter;
  StreamSubscription<CameraDiscoveryEvent>? _discoveryStreamSubscription;

  CameraDiscoveryCubit(this.cameraControl, this.wifiInfoAdapter)
      : super(const CameraDiscoveryState.init());

  @override
  Future<void> close() async {
    await _discoveryStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    emit(const CameraDiscoveryState.initInProgress());

    try {
      final localIp = await wifiInfoAdapter.getLocalIp();
      await startDiscovery();

      emit(CameraDiscoveryState.active(localIp, []));
    } catch (e) {
      emit(const CameraDiscoveryState.error());
    }
  }

  Future<void> startDiscovery() async {
    _discoveryStreamSubscription = cameraControl.discover().listen(
      (discoveryEvent) async {
        final localIp = await wifiInfoAdapter.getLocalIp();

        final previousHandles = state.maybeWhen(
            active: (_, discoveryHandles) => discoveryHandles,
            orElse: () => <DiscoveryHandle>[]);

        if (discoveryEvent is CameraDiscoveryEventAlive) {
          if (previousHandles.contains(discoveryEvent.handle)) {
            emit(CameraDiscoveryState.active(localIp, previousHandles));
            return;
          }

          emit(CameraDiscoveryState.active(
              localIp, [discoveryEvent.handle, ...previousHandles]));
        } else if (discoveryEvent is CameraDiscoveryEventByeBye) {
          final updatedHandles = [...previousHandles]
            ..removeWhere((handle) => handle.id == discoveryEvent.id);

          emit(CameraDiscoveryState.active(localIp, updatedHandles));
        }
      },
      onError: (e, s) {
        emit(const CameraDiscoveryState.error());
      },
      onDone: () async {
        final localIp = await wifiInfoAdapter.getLocalIp();
        emit(CameraDiscoveryState.paused(localIp));
      },
    );
  }

  Future<void> stopDiscovery() async {
    await _discoveryStreamSubscription?.cancel();
    emit(const CameraDiscoveryState.paused(null));
  }
}
