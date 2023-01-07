import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/camera_handle.dart';
import '../../../../domain/services/camera_remote_service.dart';

part 'camera_connection_cubit.freezed.dart';

@freezed
class CameraConnectionState with _$CameraConnectionState {
  const factory CameraConnectionState.initConnection() = _InitConnection;
  const factory CameraConnectionState.connectSuccess(
      CameraHandle cameraHandle) = _connectSuccess;
  const factory CameraConnectionState.connectFailed() = _ConnectFailed;
  const factory CameraConnectionState.disconnecting() = _Disconnecting;
  const factory CameraConnectionState.disconnected() = _Disconnected;
}

class CameraConnectionCubit extends Cubit<CameraConnectionState> {
  final CameraRemoteService cameraRemoteService;

  CameraConnectionCubit(this.cameraRemoteService)
      : super(const CameraConnectionState.disconnected());

  Future<void> connect() async {
    emit(const CameraConnectionState.initConnection());
    try {
      final handle = await cameraRemoteService.connect();
      emit(CameraConnectionState.connectSuccess(handle));
    } catch (e) {
      emit(const CameraConnectionState.connectFailed());
    }
  }

  Future<void> disconnect() async {
    emit(const CameraConnectionState.disconnecting());
    await Future.delayed(const Duration(seconds: 1));
    emit(const CameraConnectionState.disconnected());
  }

  Future<void> withConnectedCamera(
    FutureOr Function(CameraHandle cameraHandle) callback, {
    FutureOr Function()? orElse,
  }) async {
    await state.maybeWhen(
      connectSuccess: (cameraHandle) => callback(cameraHandle),
      orElse: () => orElse?.call(),
    );
  }
}
