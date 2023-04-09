import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/models/camera_descriptor.dart';
import 'base_camera_control_cubit.dart';

part 'camera_meta_cubit.freezed.dart';

@freezed
class CameraMetaState with _$CameraMetaState {
  const factory CameraMetaState.init() = _Init;
  const factory CameraMetaState.initInProgress() = _InitInProgess;
  const factory CameraMetaState.updateSuccess(CameraDescriptor descriptor) =
      _UpdateSuccess;
  const factory CameraMetaState.error() = _Error;
}

class CameraMetaCubit extends BaseCameraControlCubit<CameraMetaState> {
  CameraMetaCubit(super.cameraConnectionCubit,
      [super.initialState = const CameraMetaState.init()]);

  Future<void> init() async {
    emit(const CameraMetaState.initInProgress());

    try {
      final descriptor = await camera.getDescriptor();
      emit(CameraMetaState.updateSuccess(descriptor));
    } catch (e) {
      emit(const CameraMetaState.error());
    }
  }
}
