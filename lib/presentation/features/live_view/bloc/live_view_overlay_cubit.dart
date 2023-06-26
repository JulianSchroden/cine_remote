import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_view_overlay_cubit.freezed.dart';

@freezed
class LiveViewOverlayState with _$LiveViewOverlayState {
  const factory LiveViewOverlayState({
    @Default(true) bool showCenterMarker,
    @Default(true) bool showGrid,
  }) = _LiveViewOverlayState;
}

class LiveViewOverlayCubit extends Cubit<LiveViewOverlayState> {
  LiveViewOverlayCubit() : super(const LiveViewOverlayState());

  void setCenterMarkerEnabled(bool value) {
    emit(state.copyWith(showCenterMarker: value));
  }

  void setGridEnabled(bool value) {
    emit(state.copyWith(showGrid: value));
  }
}
