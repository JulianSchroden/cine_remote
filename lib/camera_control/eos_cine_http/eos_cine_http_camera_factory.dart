import '../interface/camera.dart';
import '../interface/camera_factory.dart';
import 'communication/http_adapter.dart';
import 'eos_cine_http_camera.dart';
import 'eos_cine_http_camera_descriptor.dart';

class EosCineHttpCameraFactory
    extends CameraFactory<EosCineHttpCameraDescriptor> {
  @override
  Future<Camera> connect(EosCineHttpCameraDescriptor descriptor) async {
    final httpAdapter = await HttpAdapter.connect();
    return EosCineHttpCamera(httpAdapter);
  }
}
