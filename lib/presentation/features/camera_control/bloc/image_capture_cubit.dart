import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/camera.dart';
import '../../../../camera_control/interface/models/capabilities/image_capture_capability.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

part 'image_capture_cubit.freezed.dart';

@freezed
class ImageCaptureState with _$ImageCaptureState {
  const factory ImageCaptureState.init() = _ImageCaptureStateInit;
  const factory ImageCaptureState.initInProgess() =
      _ImageCaptureStateInitInProgress;
  const factory ImageCaptureState.ready() = _ImageCaptureStateReady;
  const factory ImageCaptureState.inProgress() = _ImageCaptureStateInProgress;
  const factory ImageCaptureState.error() = _ImageCaptureStateError;
  const factory ImageCaptureState.unsupported() = _ImageCaptureStateUnsupported;
}

abstract class BaseCameraControlCubit<State> extends Cubit<State> {
  final CameraConnectionCubit cameraConnectionCubit;

  BaseCameraControlCubit(this.cameraConnectionCubit, super.initialState);

  Camera get camera => cameraConnectionCubit.camera;
}

class ImageCaptureCubit extends BaseCameraControlCubit<ImageCaptureState> {
  ImageCaptureCubit(
    super.cameraConnectionCubit, [
    super.initialState = const ImageCaptureState.init(),
  ]);

  Future<void> init() async {
    emit(const ImageCaptureState.initInProgess());
    try {
      final descriptor = await camera.getDescriptor();

      if (descriptor.hasCapability<ImageCaptureCapability>()) {
        emit(const ImageCaptureState.ready());
      } else {
        emit(const ImageCaptureState.unsupported());
      }
    } catch (e) {
      emit(const ImageCaptureState.error());
    }
  }

  Future<void> capture() async {
    emit(const ImageCaptureState.inProgress());

    try {
      await camera.captureImage();
      emit(const ImageCaptureState.ready());
    } catch (e) {
      emit(const ImageCaptureState.error());
    }
  }
}
