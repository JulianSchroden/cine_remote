import '../demo/demo_camera_factory.dart';
import '../eos_cine_http/eos_cine_http_camera_factory.dart';
import '../eos_ptp_ip/eos_ptp_ip_camera_factory.dart';
import 'camera_factory.dart';
import 'models/camera_control_protocol.dart';
import 'models/camera_model.dart';

class CameraFactoryProvider {
  const CameraFactoryProvider();

  CameraFactory provide(CameraModel model) {
    switch (model.protocol) {
      case CameraControlProtocol.demo:
        return DemoCameraFactory();
      case CameraControlProtocol.eosCineHttp:
        return EosCineHttpCameraFactory();
      case CameraControlProtocol.eosPtpIp:
        return EosPtpIpCameraFactory();
    }
  }
}
