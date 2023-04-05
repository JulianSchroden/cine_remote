import '../interface/camera.dart';
import '../interface/camera_factory.dart';
import 'demo_camera.dart';
import 'demo_camera_handle.dart';

class DemoCameraFactory extends CameraFactory<DemoCameraHandle> {
  @override
  Future<Camera> connect(DemoCameraHandle handle) async {
    return DemoCamera();
  }
}
