import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/control_prop_type.dart';
import '../../../core/extensions/orientation_extension.dart';

part 'camera_control_layout_cubit.freezed.dart';

@freezed
class CameraControlLayoutState with _$CameraControlLayoutState {
  const factory CameraControlLayoutState({
    required Orientation? forcedOrientation,
    required ControlPropType? activePropType,
  }) = _CameraControlPageLandscapeState;
}

class CameraControlLayoutCubit extends Cubit<CameraControlLayoutState> {
  CameraControlLayoutCubit()
      : super(const CameraControlLayoutState(
            forcedOrientation: null, activePropType: null));

  void init() {
    emit(const CameraControlLayoutState(
        forcedOrientation: null, activePropType: null));
  }

  Future<void> setForcedOrientation(Orientation? forcedOrientation) async {
    await SystemChrome.setPreferredOrientations(
        forcedOrientation.toDeviceOrientations());

    emit(state.copyWith(forcedOrientation: forcedOrientation));
  }

  void setActivePropType(ControlPropType? activePropType) {
    emit(state.copyWith(activePropType: activePropType));
  }
}