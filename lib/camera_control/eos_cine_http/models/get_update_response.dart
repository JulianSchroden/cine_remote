import '../../interface/models/camera_update_event.dart';

class GetUpdateResponse {
  final List<CameraUpdateEvent> cameraEvents;
  final int updateSequnce;

  const GetUpdateResponse({
    required this.cameraEvents,
    required this.updateSequnce,
  });
}
