import 'camera_discovery_event.dart';

abstract class CameraDiscoveryAdapter {
  Stream<CameraDiscoveryEvent> discover();
}
