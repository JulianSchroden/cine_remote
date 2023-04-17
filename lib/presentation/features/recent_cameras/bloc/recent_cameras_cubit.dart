import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/recent_camera.dart';
import '../repository/recent_cameras_repository.dart';

part 'recent_cameras_cubit.freezed.dart';

@freezed
class RecentCamerasState with _$RecentCamerasState {
  const factory RecentCamerasState.init() = _Init;
  const factory RecentCamerasState.loading() = _Loading;
  const factory RecentCamerasState.success(List<RecentCamera> recentCameras) =
      _Success;
  const factory RecentCamerasState.empty() = _Empty;
  const factory RecentCamerasState.error() = _Error;
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
    emit(const RecentCamerasState.loading());

    try {
      listenToCameraAdded();

      final recentCameras =
          await _recentCamerasRepostitory.getAllRecentCameras();

      emit(recentCameras.isEmpty
          ? const RecentCamerasState.empty()
          : RecentCamerasState.success(recentCameras));
    } catch (e) {
      emit(const RecentCamerasState.error());
    }
  }

  void listenToCameraAdded() {
    _recentCameraStreamSubscription ??=
        _recentCamerasRepostitory.onCameraAdded.listen(
      (recentCamera) {
        final oldRecentCameras = state.maybeWhen(
            success: (recentCameras) => recentCameras.toList(),
            orElse: () => <RecentCamera>[]);

        final indexOfOldEntry =
            oldRecentCameras.indexWhere((entry) => entry.id == recentCamera.id);
        if (indexOfOldEntry != -1) {
          oldRecentCameras.removeAt(indexOfOldEntry);
        }

        emit(RecentCamerasState.success([recentCamera, ...oldRecentCameras]));
      },
    );
  }
}
