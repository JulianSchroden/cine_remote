import '../interface/camera.dart';
import '../interface/camera_factory.dart';
import 'demo_camera.dart';
import 'demo_camera_descriptor.dart';

class DemoCameraFactory extends CameraFactory<DemoCameraDescriptor> {
  @override
  Future<Camera> connect(DemoCameraDescriptor descriptor) async {
    return DemoCamera();
  }
}
