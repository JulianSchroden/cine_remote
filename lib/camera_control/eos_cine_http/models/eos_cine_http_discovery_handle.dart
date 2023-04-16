import '../../interface/discovery/discovery_handle.dart';
import '../eos_cine_http_camera_pairing_data.dart';

class EosCineHttpDiscoveryHandle extends DiscoveryHandle {
  const EosCineHttpDiscoveryHandle({
    required super.id,
    required super.model,
    super.pairingData = const EosCineHttpCameraPairingData(),
  });

  @override
  String toString() {
    return 'DiscoveredEosCineHttpCamera(model: $model)';
  }
}
