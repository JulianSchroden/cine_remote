import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_control_layout_cubit.freezed.dart';

@freezed
class CameraControlLayoutState with _$CameraControlLayoutState {
  const factory CameraControlLayoutState({
    required ControlPropType? activePropType,
    required bool showMenu,
  }) = _CameraControlPageLandscapeState;
}

class CameraControlLayoutCubit extends Cubit<CameraControlLayoutState> {
  CameraControlLayoutCubit()
      : super(const CameraControlLayoutState(
          activePropType: null,
          showMenu: false,
        ));

  void setActivePropType(ControlPropType? activePropType) {
    emit(state.copyWith(activePropType: activePropType, showMenu: false));
  }

  void toggleMenu() {
    emit(state.copyWith(activePropType: null, showMenu: !state.showMenu));
  }
}
