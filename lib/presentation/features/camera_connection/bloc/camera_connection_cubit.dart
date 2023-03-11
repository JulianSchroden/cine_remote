import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/demo/demo_camera_descriptor.dart';
import '../../../../camera_control/interface/camera.dart';
import '../../../../camera_control/interface/camera_factory.dart';
import '../../../../camera_control/interface/models/camera_model.dart';
import '../../../../camera_control/interface/models/camera_update_event.dart';

part 'camera_connection_cubit.freezed.dart';

@freezed
class CameraConnectionState with _$CameraConnectionState {
  const CameraConnectionState._();

  const factory CameraConnectionState.connecting() = _InitConnection;
  const factory CameraConnectionState.connectingFailed() = _ConnectingFailed;
  const factory CameraConnectionState.connected(Camera camera) =
      _ConnectionEstablished;
  const factory CameraConnectionState.disconnecting() = _Disconnecting;
  const factory CameraConnectionState.disconnected() = _Disconnected;

  bool get isLoading => maybeWhen(
      connecting: () => true, disconnecting: () => true, orElse: () => false);
}

class CameraConnectionCubit extends Cubit<CameraConnectionState> {
  final CameraFactory _cameraFactory;
  StreamController<CameraUpdateEvent>? _cameraUpdateStreamController;
  Timer? _updateTimer;

  CameraConnectionCubit([this._cameraFactory = const DefaultCameraFactory()])
      : super(const CameraConnectionState.disconnected());

  @override
  Future<void> close() async {
    _updateTimer?.cancel();
    await _cameraUpdateStreamController?.close();
    return super.close();
  }

  Future<void> connect(CameraModel cameraModel) async {
    try {
      print('cubit connect');

      emit(const CameraConnectionState.connecting());
      // TODO: map model to descriptor
      final camera = await _cameraFactory.connect(DemoCameraDescriptor());

      print('connection success');
      emit(CameraConnectionState.connected(camera));
    } catch (e) {
      print(e);
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
    FutureOr Function(Camera camera) callback, {
    FutureOr Function()? orElse,
  }) async {
    await state.maybeWhen(
      connected: (cameraHandle) => callback(cameraHandle),
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
            if (_cameraUpdateStreamController?.isClosed ?? true) return;

            withConnectedCamera((camera) async {
              final updateResponse = await camera.getUpdate();

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
