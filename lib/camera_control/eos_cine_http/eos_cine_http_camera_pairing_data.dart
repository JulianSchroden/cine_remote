import '../interface/models/pairing_data.dart';
import 'constants/eos_cine_ip_config.dart';

class EosCineHttpCameraPairingData extends PairingData {
  final String address;

  const EosCineHttpCameraPairingData({
    this.address = EosCineIpConfig.gatewayIp,
  });

  @override
  List<Object?> get props => [address];
}
