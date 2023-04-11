import '../demo/demo_camera_handle.dart';
import '../demo/demo_camera_factory.dart';
import '../eos_cine_http/eos_cine_http_camera_handle.dart';
import '../eos_cine_http/eos_cine_http_camera_factory.dart';
import '../eos_ptp_ip/eos_ptp_ip_camera_handle.dart';
import '../eos_ptp_ip/eos_ptp_ip_camera_factory.dart';
import 'camera.dart';
import 'models/camera_handle.dart';
import 'models/camera_model.dart';

abstract class CameraId {
  CameraId._();

  static const demoCamera = "demoCamera";
  static const canonC100II = "CanonC100II";
  static const canon70D = "Canon70D";

  static List<String> values = [demoCamera, canonC100II, canon70D];
}

class CameraModels {
  static const demoCamera =
      CameraModel(identifier: CameraId.demoCamera, name: 'Demo Camera');
  static const canonC100II =
      CameraModel(identifier: CameraId.canonC100II, name: 'Canon EOS C100 II');
  static const canon70D =
      CameraModel(identifier: CameraId.canon70D, name: 'Canon EOS 70D');

  static const List<CameraModel> supportedCameras = [
    demoCamera,
    canonC100II,
    canon70D,
  ];
}

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
