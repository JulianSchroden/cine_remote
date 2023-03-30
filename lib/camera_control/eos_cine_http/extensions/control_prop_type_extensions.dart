import '../../interface/models/control_prop_type.dart';

extension ControlPropTypeToPropKeyExtension on ControlPropType {
  String? toKey() {
    switch (this) {
      case ControlPropType.iso:
        return 'gcv';
      case ControlPropType.aperture:
        return 'av';
      case ControlPropType.shutterAngle:
        return 'ssv';
      case ControlPropType.whiteBalance:
        return 'wbv';
      default:
        return null;
    }
  }
}
