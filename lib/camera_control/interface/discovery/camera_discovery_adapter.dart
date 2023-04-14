import 'discovery_handle.dart';

abstract class CameraDiscoveryAdapter {
  Stream<DiscoveryHandle> discover();
}
