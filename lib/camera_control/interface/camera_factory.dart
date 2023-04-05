import '../demo/demo_camera_handle.dart';
import '../demo/demo_camera_factory.dart';
import '../eos_cine_http/eos_cine_http_camera_handle.dart';
import '../eos_cine_http/eos_cine_http_camera_factory.dart';
import '../eos_ptp_ip/eos_ptp_ip_camera_handle.dart';
import '../eos_ptp_ip/eos_ptp_ip_camera_factory.dart';
import 'camera.dart';
import 'models/camera_handle.dart';

abstract class CameraFactory<H extends CameraHandle> {
  const CameraFactory();

  Future<Camera> connect(H handle);
}

class DefaultCameraFactory extends CameraFactory {
  const DefaultCameraFactory();

  @override
  Future<Camera> connect(CameraHandle handle) {
    print(handle.runtimeType);
    switch (handle.runtimeType) {
      case DemoCameraHandle:
        return DemoCameraFactory().connect(handle as DemoCameraHandle);
      case EosCineHttpCameraHandle:
        return EosCineHttpCameraFactory()
            .connect(handle as EosCineHttpCameraHandle);
      case EosPtpIpCameraHandle:
        return EosPtpIpCameraFactory().connect(handle as EosPtpIpCameraHandle);
    }

    throw UnimplementedError();
  }
}
