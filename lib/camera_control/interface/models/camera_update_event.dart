import 'package:freezed_annotation/freezed_annotation.dart';

import 'control_prop_type.dart';
import 'control_prop_value.dart';
import 'properties/auto_focus_mode.dart';

part 'camera_update_event.freezed.dart';

@freezed
class CameraUpdateEvent with _$CameraUpdateEvent {
  const factory CameraUpdateEvent.prop(
      ControlPropType propType, ControlPropValue value) = _PropUpdate;
  const factory CameraUpdateEvent.recordState(bool isRecording) =
      _RecordStateUpdate;
  const factory CameraUpdateEvent.focusMode(AutoFocusMode focusMode) =
      _FocusModeUpdate;
  const factory CameraUpdateEvent.ndFilter(int ndValue) = _NdFilterUpdate;
}
