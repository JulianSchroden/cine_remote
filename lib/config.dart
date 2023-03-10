import 'camera_control/interface/models/camera_model.dart';

abstract class CameraId {
  CameraId._();

  static const fakeCamera = "fakeCamera";
  static const canonC100II = "CanonC100II";
  static const canon70D = "Canon70D";

  static List<String> values = [canonC100II, fakeCamera];
}

class Config {
  List<CameraModel> get supportedCameras => [
        const CameraModel(identifier: CameraId.fakeCamera, name: 'Fake Camera'),
        const CameraModel(
            identifier: CameraId.canonC100II, name: 'Canon EOS C100 II'),
        const CameraModel(identifier: CameraId.canon70D, name: 'Canon EOS 70D'),
      ];
}
