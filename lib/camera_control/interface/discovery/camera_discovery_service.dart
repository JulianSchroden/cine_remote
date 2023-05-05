import '../../common/discovery/default_camera_discovery_service.dart';
import 'camera_discovery_event.dart';
import 'wifi_info.dart';

abstract class CameraDiscoveryService {
  factory CameraDiscoveryService.create() => DefaultCameraDiscoveryService();

  Future<WifiInfo> wifiInfo();

  Stream<CameraDiscoveryEvent> discover();
}
