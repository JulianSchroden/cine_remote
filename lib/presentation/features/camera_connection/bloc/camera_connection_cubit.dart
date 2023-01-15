import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../dependencies.dart';
import '../../../../domain/models/camera_handle.dart';
import '../../../../domain/models/camera_model.dart';
import '../../../../domain/models/camera_update_event.dart';
import '../../../../domain/services/camera_remote_service.dart';

part 'camera_connection_cubit.freezed.dart';

@freezed
class CameraConnectionState with _$CameraConnectionState {
  const CameraConnectionState._();

  const factory CameraConnectionState.connecting() = _InitConnection;
  const factory CameraConnectionState.connectingFailed() = _ConnectingFailed;
  const factory CameraConnectionState.connectionEstablished(
      CameraHandle cameraHandle) = _ConnectionEstablished;
  const factory CameraConnectionState.connectionUpdated(
      CameraHandle cameraHandle) = _ConnectionUpdated;
  const factory CameraConnectionState.disconnecting() = _Disconnecting;
  const factory CameraConnectionState.disconnected() = _Disconnected;

  bool get isLoading => maybeWhen(
      connecting: () => true, disconnecting: () => true, orElse: () => false);
}

class CameraConnectionCubit extends Cubit<CameraConnectionState> {
  final DependencyHelper _dependencyHelper;
  CameraRemoteService? _cameraRemoteService;
  StreamController<CameraUpdateEvent>? _cameraUpdateStreamController;
  Timer? _updateTimer;

  CameraConnectionCubit(this._dependencyHelper)
      : super(const CameraConnectionState.disconnected());

  @override
  Future<void> close() async {
    _updateTimer?.cancel();
    await _cameraUpdateStreamController?.close();
    return super.close();
  }

  Future<void> connect(CameraModel cameraModel) async {
    try {
      _cameraRemoteService =
          _dependencyHelper.registerCameraRemoteService(cameraModel);

      emit(const CameraConnectionState.connecting());

      final cameraHandle = await _cameraRemoteService!.connect();
      emit(CameraConnectionState.connectionEstablished(cameraHandle));
    } catch (e) {
      emit(const CameraConnectionState.connectingFailed());
    }
  }

  Future<void> disconnect() async {
    emit(const CameraConnectionState.disconnecting());
    _updateTimer?.cancel();
    _updateTimer = null;
    await _cameraUpdateStreamController?.close();
    _cameraUpdateStreamController = null;
    await Future.delayed(const Duration(seconds: 1));
    emit(const CameraConnectionState.disconnected());
  }

  Future<void> withConnectedCamera(
    FutureOr Function(CameraHandle cameraHandle) callback, {
    FutureOr Function()? orElse,
  }) async {
    await state.maybeWhen(
      connectionEstablished: (cameraHandle) => callback(cameraHandle),
      connectionUpdated: (cameraHandle) => callback(cameraHandle),
      orElse: () => orElse?.call(),
    );
  }

  Stream<CameraUpdateEvent> get updateEvents {
    if (_cameraUpdateStreamController?.isClosed ?? true) {
      _cameraUpdateStreamController =
          StreamController<CameraUpdateEvent>.broadcast(
        onListen: () {
          _updateTimer =
              Timer.periodic(const Duration(milliseconds: 500), (timer) {
            if (_cameraRemoteService == null) return;
            if (_cameraUpdateStreamController?.isClosed ?? true) return;

            withConnectedCamera((cameraHandle) async {
              final updateResponse =
                  await _cameraRemoteService!.getUpdate(cameraHandle);
              emit(CameraConnectionState.connectionUpdated(
                  updateResponse.cameraHandle));
              await _cameraUpdateStreamController
                  ?.addStream(Stream.fromIterable(updateResponse.cameraEvents));
            }, orElse: () {
              timer.cancel();
            });
          });
        },
        onCancel: () {
          _updateTimer?.cancel();
        },
      );
    }

    return _cameraUpdateStreamController!.stream;
  }
}
