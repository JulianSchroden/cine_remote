import '../../../domain/models/control_prop.dart';
import '../../../domain/models/control_prop_type.dart';

extension FormatControlPropExtension on ControlProp {
  String format() {
    switch (type) {
      case ControlPropType.iso:
        return 'ISO $currentValue';
      case ControlPropType.aperture:
        return 'F$currentValue';
      case ControlPropType.shutterAngle:
        return '$currentValue°';
      case ControlPropType.whiteBalance:
        return '${currentValue}K';
    }
  }
}
