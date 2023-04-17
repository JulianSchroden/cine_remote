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

  RecentCamerasCubit(this._recentCamerasRepostitory)
      : super(const RecentCamerasState.init());

  Future<void> load() async {
    emit(const RecentCamerasState.loading());

    try {
      final recentCameras =
          await _recentCamerasRepostitory.getAllRecentCameras();

      emit(recentCameras.isEmpty
          ? const RecentCamerasState.empty()
          : RecentCamerasState.success(recentCameras));
    } catch (e) {
      emit(const RecentCamerasState.error());
    }
  }
}
