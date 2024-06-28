import 'package:camera_control_dart/camera_control_dart.dart';

extension CameraModelDisplayExtension on CameraModel {
  String? productImagePath() {
    switch (identifier) {
      case CameraId.canonC100II:
        return 'assets/images/canon_c100_ii.png';
      case CameraId.canon70D:
        return 'assets/images/canon_70d.png';
      case CameraId.canonR7:
        return 'assets/images/canon_r7.png';
    }

    return null;
  }
}
