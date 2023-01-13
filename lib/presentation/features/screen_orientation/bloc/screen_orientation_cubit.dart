import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/extensions/orientation_extension.dart';

part 'screen_orientation_cubit.freezed.dart';

@freezed
class ScreenOrientationState with _$ScreenOrientationState {
  const factory ScreenOrientationState({
    required Orientation? forcedOrientation,
  }) = _ScreenOrientationState;
}

class ScreenOrientationCubit extends Cubit<ScreenOrientationState> {
  ScreenOrientationCubit()
      : super(const ScreenOrientationState(forcedOrientation: null));

  Future<void> setForcedOrientation(Orientation? forcedOrientation) async {
    await SystemChrome.setPreferredOrientations(
      forcedOrientation.toDeviceOrientations(),
    );

    emit(state.copyWith(forcedOrientation: forcedOrientation));
  }
}
