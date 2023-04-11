import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/camera.dart';
import '../../../../camera_control/interface/camera_factory.dart';
import '../../../../camera_control/interface/exceptions/camera_connection_exception.dart';
import '../../../../camera_control/interface/models/camera_handle.dart';
import '../../../../camera_control/interface/models/camera_update_event.dart';

part 'camera_connection_cubit.freezed.dart';

@freezed
class CameraConnectionState with _$CameraConnectionState {
  const CameraConnectionState._();

  const factory CameraConnectionState.connecting() = _InitConnection;
  const factory CameraConnectionState.connectingFailed() = _ConnectingFailed;
  const factory CameraConnectionState.connected(Camera camera) =
      _ConnectionEstablished;
  const factory CameraConnectionState.disconnecting(Camera camera) =
      _Disconnecting;
  const factory CameraConnectionState.disconnected() = _Disconnected;

  bool get isLoading => maybeWhen(
      connecting: () => true, disconnecting: (_) => true, orElse: () => false);
}

class CameraConnectionCubit extends Cubit<CameraConnectionState> {
  final CameraFactory _cameraFactory;

  CameraConnectionCubit([this._cameraFactory = const DefaultCameraFactory()])
      : super(const CameraConnectionState.disconnected());

  @override
  Future<void> close() async {
    return super.close();
  }

  Future<void> connect(CameraHandle cameraHandle) async {
    try {
      print('cubit connect');

      emit(const CameraConnectionState.connecting());
      final camera = await _cameraFactory.connect(cameraHandle);

      print('connection success');
      emit(CameraConnectionState.connected(camera));
    } catch (e) {
      print(e);
      emit(const CameraConnectionState.connectingFailed());
    }
  }

  Future<void> disconnect() async {
    try {
      emit(CameraConnectionState.disconnecting(camera));
      await camera.disconnect();
    } catch (e) {
      print(e);
    } finally {
      emit(const CameraConnectionState.disconnected());
    }
  }

  T withConnectedCamera<T>(
    T Function(Camera camera) callback, {
    required T Function() orElse,
  }) =>
      state.maybeWhen(
        connected: (camera) => callback(camera),
        disconnecting: (camera) => callback(camera),
        orElse: () => orElse(),
      );

  Camera get camera => state.maybeWhen(
        connected: (camera) => camera,
        disconnecting: (camera) => camera,
        orElse: () {
          throw const CameraConnectionException(
              'Tried to access camera but no camera connected');
        },
      );

  Stream<CameraUpdateEvent> get updateEvents => withConnectedCamera(
        (camera) => camera.events(),
        orElse: () => Stream.fromIterable([]),
      );
}
