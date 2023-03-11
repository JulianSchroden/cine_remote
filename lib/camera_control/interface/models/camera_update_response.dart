import 'package:freezed_annotation/freezed_annotation.dart';

import 'camera_update_event.dart';

part 'camera_update_response.freezed.dart';

@freezed
class CameraUpdateResponse with _$CameraUpdateResponse {
  const factory CameraUpdateResponse({
    required List<CameraUpdateEvent> cameraEvents,
  }) = _CameraUpdateResponse;
}
