import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../camera_control/interface/models/properties/autofocus_position.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../../camera_control/bloc/base_camera_control_cubit.dart';

part 'touch_autofocus_cubit.freezed.dart';

@freezed
class TouchAutofocusState with _$TouchAutofocusState {
  const factory TouchAutofocusState.initial() = TouchAutofocusStateInitial;
  const factory TouchAutofocusState.inProgress() = _TouchAutofocusInProgress;
  const factory TouchAutofocusState.updated() = _TouchAutofocusUpdated;
  const factory TouchAutofocusState.error() = _TouchAutofocusError;
}

class TouchAutofocusCubit extends BaseCameraControlCubit<TouchAutofocusState> {
  TouchAutofocusCubit(CameraConnectionCubit cameraConnectionCubit)
      : super(cameraConnectionCubit, const TouchAutofocusState.initial());

  Future<void> setTouchAutofocus(AutofocusPosition autofocusPosition) async {
    emit(const TouchAutofocusState.inProgress());
    try {
      await camera.setAutofocusPosition(autofocusPosition);
      emit(const TouchAutofocusState.updated());
    } catch (e) {
      emit(const TouchAutofocusState.error());
    }
  }
}
