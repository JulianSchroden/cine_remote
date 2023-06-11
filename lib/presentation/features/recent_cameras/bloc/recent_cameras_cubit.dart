import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/recent_camera.dart';
import '../repository/recent_cameras_repository.dart';

part 'recent_cameras_cubit.freezed.dart';

@freezed
class RecentCamerasState with _$RecentCamerasState {
  const RecentCamerasState._();

  const factory RecentCamerasState.init() = _Init;
  const factory RecentCamerasState.loading(List<RecentCamera> recentCameras) =
      _Loading;
  const factory RecentCamerasState.success(List<RecentCamera> recentCameras) =
      _Success;
  const factory RecentCamerasState.empty() = _Empty;
  const factory RecentCamerasState.error() = _Error;

  List<RecentCamera> get recentCameras => maybeWhen(
      loading: (recentCameras) => recentCameras,
      success: (recentCameras) => recentCameras,
      orElse: () => <RecentCamera>[]);
}

class RecentCamerasCubit extends Cubit<RecentCamerasState> {
  final RecentCamerasRepostitory _recentCamerasRepostitory;
  StreamSubscription<RecentCamera>? _recentCameraStreamSubscription;

  RecentCamerasCubit(this._recentCamerasRepostitory)
      : super(const RecentCamerasState.init());

  @override
  Future<void> close() async {
    await _recentCameraStreamSubscription?.cancel();
    await super.close();
  }

  Future<void> load() async {
    emit(const RecentCamerasState.loading([]));

    try {
      _listenToCameraAdded();

      final recentCameras =
          await _recentCamerasRepostitory.getAllRecentCameras();

      emit(recentCameras.isEmpty
          ? const RecentCamerasState.empty()
          : RecentCamerasState.success(recentCameras));
    } catch (e) {
      emit(const RecentCamerasState.error());
    }
  }

  void copyEncodedCameraToClipboard(RecentCamera recentCamera) {
    final encodedContent = jsonEncode(recentCamera.toJson());
    Clipboard.setData(ClipboardData(text: encodedContent));
  }

  Future<void> addEncodedCamera(String encodedCamera) async {
    try {
      emit(RecentCamerasState.loading(state.recentCameras));
      final recentCamera = RecentCamera.fromJson(jsonDecode(encodedCamera));

      await _recentCamerasRepostitory.addRecentCamera(recentCamera);
    } catch (e) {
      emit(const RecentCamerasState.error());
    }
  }

  Future<void> forgetCamera(RecentCamera recentCamera) async {
    try {
      emit(RecentCamerasState.loading(state.recentCameras));

      await _recentCamerasRepostitory.removeCamera(recentCamera.id);

      final recentCameras = state.recentCameras.toList()
        ..removeWhere((entry) => entry.id == recentCamera.id);
      emit(RecentCamerasState.success(recentCameras));
    } catch (e) {
      emit(const RecentCamerasState.error());
    }
  }

  void _listenToCameraAdded() {
    _recentCameraStreamSubscription ??=
        _recentCamerasRepostitory.onCameraAdded.listen(
      (recentCamera) {
        final recentCameras = state.recentCameras.toList()
          ..removeWhere((entry) => entry.id == recentCamera.id);

        emit(RecentCamerasState.success([recentCamera, ...recentCameras]));
      },
    );
  }
}
