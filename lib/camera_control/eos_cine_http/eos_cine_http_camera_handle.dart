import 'constants/eos_cine_ip_config.dart';

import '../interface/models/camera_handle.dart';

class EosCineHttpCameraHandle extends CameraHandle {
  final String address;

  const EosCineHttpCameraHandle({
    required super.model,
    this.address = EosCineIpConfig.gatewayIp,
  });

  @override
  List<Object?> get props => [...super.props, address];
}
