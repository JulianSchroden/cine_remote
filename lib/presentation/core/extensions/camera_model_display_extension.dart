import '../../../camera_control/interface/camera_factory.dart';
import '../../../camera_control/interface/models/camera_model.dart';

extension CameraModelDisplayExtension on CameraModel {
  String? productImagePath() {
    switch (identifier) {
      case CameraId.canonC100II:
        return 'assets/images/canon_c100_ii.png';
      case CameraId.canon70D:
        return 'assets/images/canon_70d.png';
    }

    return null;
  }
}
