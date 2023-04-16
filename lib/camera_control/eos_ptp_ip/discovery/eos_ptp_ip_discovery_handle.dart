import '../../interface/discovery/discovery_handle.dart';

class EosPtpIpDiscoveryHandle extends DiscoveryHandle {
  final String address;

  const EosPtpIpDiscoveryHandle({
    required this.address,
    required super.id,
    required super.model,
  });
}
