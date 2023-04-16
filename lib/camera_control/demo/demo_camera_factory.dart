import '../interface/camera.dart';
import '../interface/camera_factory.dart';
import '../interface/discovery/discovery_handle.dart';
import '../interface/models/camera_handle.dart';
import '../interface/models/pairing_data.dart';
import 'demo_camera.dart';
import 'demo_camera_pairing_data.dart';

class DemoCameraFactory extends CameraFactory {
  @override
  Future<Camera> connect(CameraHandle handle) async {
    return DemoCamera();
  }
}
