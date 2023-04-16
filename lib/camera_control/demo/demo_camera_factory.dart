import '../interface/camera.dart';
import '../interface/camera_factory.dart';
import '../interface/models/camera_handle.dart';
import 'demo_camera.dart';

class DemoCameraFactory extends CameraFactory {
  @override
  Future<Camera> connect(CameraHandle handle) async {
    return DemoCamera();
  }
}
