import 'dart:async';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../recent_cameras/repository/recent_cameras_repository.dart';

part 'camera_connection_cubit.freezed.dart';

@freezed
class CameraConnectionState with _$CameraConnectionState {
  const CameraConnectionState._();

  const factory CameraConnectionState.connecting() = _InitConnection;
  const factory CameraConnectionState.connectingFailed() = _ConnectingFailed;
  const factory CameraConnectionState.requiresPairing(DiscoveryHandle handle) =
      _RequiresPairing;
  const factory CameraConnectionState.connected(Camera camera) =
      _ConnectionEstablished;
  const factory CameraConnectionState.disconnecting(Camera camera) =
      _Disconnecting;
  const factory CameraConnectionState.disconnected() = _Disconnected;

  bool get isLoading => maybeWhen(
      connecting: () => true, disconnecting: (_) => true, orElse: () => false);
}

class CameraConnectionCubit extends Cubit<CameraConnectionState> {
  final CameraControl cameraControl;
  final RecentCamerasRepostitory recentCamerasRepostitory;

  CameraConnectionCubit({
    required this.cameraControl,
    required this.recentCamerasRepostitory,
  }) : super(const CameraConnectionState.disconnected());

  Future<void> connectToDiscoveredCamera(
    DiscoveryHandle discoveryHandle,
  ) async {
    try {
      emit(const CameraConnectionState.connecting());

      final pairingData = await getPairingData(discoveryHandle);
      if (pairingData == null) {
        emit(CameraConnectionState.requiresPairing(discoveryHandle));
        return;
      }

      final cameraHandle = CameraConnectionHandle(
          id: discoveryHandle.id,
          model: discoveryHandle.model,
          pairingData: pairingData);

      return connect(cameraHandle);
    } catch (e) {
      emit(const CameraConnectionState.connectingFailed());
    }
  }

  Future<PairingData?> getPairingData(DiscoveryHandle discoveryHandle) async {
    if (discoveryHandle.pairingData != null) {
      return discoveryHandle.pairingData;
    }

    return await recentCamerasRepostitory.getPairingData(discoveryHandle.id);
  }

  Future<void> connect(CameraConnectionHandle cameraHandle) async {
    try {
      emit(const CameraConnectionState.connecting());
      final camera = await cameraControl.connect(cameraHandle);
      await recentCamerasRepostitory.addCamera(cameraHandle);

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

  Future<void> handleConnectionAborted(
    String message,
    dynamic e,
    StackTrace s,
  ) async {
    print('handleConnectionAborted: $message');
    print(e);
    print(s);

    await _withConnectedCamera((camera) async {
      emit(CameraConnectionState.disconnecting(camera));
      await camera.close();
    }, orElse: () {});

    emit(const CameraConnectionState.disconnected());
  }

  T _withConnectedCamera<T>(
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

  Stream<CameraUpdateEvent> get updateEvents => _withConnectedCamera(
        (camera) => camera.events().handleError(
            (e, s) => handleConnectionAborted('update events error', e, s)),
        orElse: () => Stream.fromIterable([]),
      );
}
