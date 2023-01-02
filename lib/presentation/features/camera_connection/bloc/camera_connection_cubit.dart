import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/wifi_camera_handle.dart';
import '../../../../data/services/camera_remote_service.dart';
import '../../../../domain/models/control_prop_type.dart';

part 'camera_connection_cubit.freezed.dart';

@freezed
class CameraConnectionState with _$CameraConnectionState {
  const factory CameraConnectionState.initConnection() = _InitConnection;
  const factory CameraConnectionState.connectSuccess(
      WifiCameraHandle cameraHandle) = _connectSuccess;
  const factory CameraConnectionState.connectFailed() = _ConnectFailed;
  const factory CameraConnectionState.disconnecting() = _Disconnecting;
  const factory CameraConnectionState.disconnected() = _Disconnected;
}

class CameraConnectionCubit extends Cubit<CameraConnectionState> {
  CameraRemoteService cameraRemoteService;

  CameraConnectionCubit({required this.cameraRemoteService})
      : super(const CameraConnectionState.disconnected());

  Future<void> connect() async {
    print('connect');
    emit(const CameraConnectionState.initConnection());
    await Future.delayed(const Duration(seconds: 2));
    emit(CameraConnectionState.connectSuccess(
        WifiCameraHandle(cookies: [], supportedProps: [
      ControlPropType.aperture,
      ControlPropType.iso,
      ControlPropType.shutterAngle,
      ControlPropType.whiteBalance,
    ])));
    return;
    try {
      final handle = await cameraRemoteService.connect();
      emit(CameraConnectionState.connectSuccess(handle));
    } catch (e) {
      print(e);
      emit(const CameraConnectionState.connectFailed());
    }
  }

  Future<void> disconnect() async {
    emit(const CameraConnectionState.disconnecting());
    await Future.delayed(const Duration(seconds: 1));
    emit(const CameraConnectionState.disconnected());
  }
}
