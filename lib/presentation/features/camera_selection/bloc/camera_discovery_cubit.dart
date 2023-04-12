import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network_info_plus/network_info_plus.dart';

part 'camera_discovery_cubit.freezed.dart';

@freezed
class CameraDiscoveryState with _$CameraDiscoveryState {
  const CameraDiscoveryState._();

  const factory CameraDiscoveryState.init() = _Init;
  const factory CameraDiscoveryState.initInProgress() = _InitInProgress;
  const factory CameraDiscoveryState.active(String? currentIp) = _Active;
  const factory CameraDiscoveryState.paused(String? currentIp) = _Paused;
  const factory CameraDiscoveryState.error() = _Error;

  String? get currentIp => maybeWhen(
        paused: (currentIp) => currentIp,
        active: (currentIp) => currentIp,
        orElse: () => null,
      );
}

class CameraDiscoveryCubit extends Cubit<CameraDiscoveryState> {
  final NetworkInfo networkInfo;
  CameraDiscoveryCubit(this.networkInfo)
      : super(const CameraDiscoveryState.init());

  Future<void> init() async {
    emit(const CameraDiscoveryState.initInProgress());

    try {
      final ipAddress = await networkInfo.getWifiIP();

      emit(CameraDiscoveryState.paused(ipAddress));
    } catch (e) {
      emit(const CameraDiscoveryState.error());
    }
  }
}
