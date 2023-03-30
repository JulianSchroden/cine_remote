import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/camera.dart';
import '../../../../camera_control/interface/camera_factory.dart';
import '../../../../camera_control/interface/models/camera_model.dart';
import '../../../../camera_control/interface/models/camera_update_event.dart';
import '../../../../camera_control/interface/models/camera_update_response.dart';
import '../../../core/extensions/camera_model_to_descriptor_extension.dart';

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

  Future<void> connect(CameraModel cameraModel) async {
    try {
      print('cubit connect');

      emit(const CameraConnectionState.connecting());
      final camera = await _cameraFactory.connect(cameraModel.toDescriptor());

      print('connection success');
      emit(CameraConnectionState.connected(camera));
    } catch (e) {
      print(e);
      emit(const CameraConnectionState.connectingFailed());
    }
  }

  Future<void> disconnect() async {
    await withConnectedCamera(
      (camera) async {
        emit(CameraConnectionState.disconnecting(camera));
        await camera.disconnect();
      },
      orElse: () {},
    );

    await Future.delayed(const Duration(seconds: 1));
    emit(const CameraConnectionState.disconnected());
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

  Stream<CameraUpdateEvent> get updateEvents => withConnectedCamera(
      (camera) => camera
          .events()
          .asyncExpand((event) => Stream.fromIterable(event.cameraEvents)),
      orElse: () => Stream.fromIterable([]));
}
