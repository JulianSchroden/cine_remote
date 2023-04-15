import '../../interface/discovery/discovery_handle.dart';

class EosCineHttpDiscoveryHandle extends DiscoveryHandle {
  const EosCineHttpDiscoveryHandle({
    required super.id,
    required super.model,
  });

  @override
  String toString() {
    return 'DiscoveredEosCineHttpCamera(model: $model)';
  }
}
