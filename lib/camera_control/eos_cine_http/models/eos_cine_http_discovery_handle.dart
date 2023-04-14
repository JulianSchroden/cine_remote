import '../../interface/discovery/discovery_handle.dart';

class EosCineHttpDiscoveryHandle extends DiscoveryHandle {
  const EosCineHttpDiscoveryHandle(super.model);

  @override
  String toString() {
    return 'DiscoveredEosCineHttpCamera(model: $model)';
  }
}
