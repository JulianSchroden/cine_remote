import 'dart:async';

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  StreamSubscription<CameraUpdateEvent>? _updateStreamSubscription;

  CameraMetaCubit(
    super.cameraConnectionCubit, [
    super.initialState = const CameraMetaState.init(),
  ]);

  @override
  Future<void> close() async {
    await _updateStreamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    emit(const CameraMetaState.initInProgress());

    try {
      final descriptor = await camera.getDescriptor();
      emit(CameraMetaState.updateSuccess(descriptor));
    } catch (e) {
      emit(const CameraMetaState.error());
    }

    await _setupUpdateListener();
  }

  Future<void> _setupUpdateListener() async {
    await _updateStreamSubscription?.cancel();
    _updateStreamSubscription = cameraConnectionCubit.updateEvents.listen(
      (updateEvent) => updateEvent.maybeWhen<void>(
        descriptorChanged: (descriptor) {
          emit(CameraMetaState.updateSuccess(descriptor));
        },
        orElse: () {},
      ),
      onError: (e, s) {
        emit(const CameraMetaState.error());
      },
    );
  }
}
