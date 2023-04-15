import '../interface/camera.dart';
import '../interface/camera_factory.dart';
import '../interface/discovery/discovery_handle.dart';
import '../interface/models/camera_handle.dart';
import '../interface/models/pairing_data.dart';
import 'demo_camera.dart';
import 'demo_camera_pairing_data.dart';

class DemoCameraFactory extends CameraFactory {
  @override
  Future<CameraHandle<PairingData>?> prepare(
      DiscoveryHandle discoveryHandle, PairingData? pairingData) async {
    return CameraHandle(
      id: discoveryHandle.id,
      model: discoveryHandle.model,
      pairingData: const DemoCameraPairingData(),
    );
  }

  @override
  Future<Camera> connect(CameraHandle handle) async {
    return DemoCamera();
  }
}
