import '../demo/demo_camera_descriptor.dart';
import '../demo/demo_camera_factory.dart';
import '../eos_cine_http/eos_cine_http_camera_descriptor.dart';
import '../eos_cine_http/eos_cine_http_camera_factory.dart';
import '../eos_ptp_ip/eos_ptp_ip_camera_descriptor.dart';
import '../eos_ptp_ip/eos_ptp_ip_camera_factory.dart';
import 'camera.dart';
import 'models/camera_descriptor.dart';

abstract class CameraFactory<D extends CameraDescriptor> {
  const CameraFactory();

  Future<Camera> connect(D descriptor);
}

class DefaultCameraFactory extends CameraFactory {
  const DefaultCameraFactory();

  @override
  Future<Camera> connect(CameraDescriptor descriptor) {
    print(descriptor.runtimeType);
    switch (descriptor.runtimeType) {
      case DemoCameraDescriptor:
        return DemoCameraFactory().connect(descriptor as DemoCameraDescriptor);
      case EosCineHttpCameraDescriptor:
        return EosCineHttpCameraFactory()
            .connect(descriptor as EosCineHttpCameraDescriptor);
      case EosPtpIpCameraDescriptor:
        return EosPtpIpCameraFactory()
            .connect(descriptor as EosPtpIpCameraDescriptor);
    }

    throw UnimplementedError();
  }
}
