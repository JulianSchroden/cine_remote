import 'package:camera_control_dart/camera_control_dart.dart';

extension FormatControlPropExtension on ControlProp {
  String format() {
    switch (type) {
      case ControlPropType.iso:
        return 'ISO ${currentValue.value}';
      case ControlPropType.aperture:
        return 'F${currentValue.value}';
      case ControlPropType.shutterAngle:
        return '${currentValue.value}°';
      case ControlPropType.shutterSpeed:
        return currentValue.value;
      case ControlPropType.whiteBalance:
        return '${currentValue.value}K';
    }
  }
}

extension ControlPropIsPending on ControlProp {
  bool isWithinPendingTime(DateTime currentTime, Duration pendingDuration) {
    if (pendingSince == null) return false;

    return currentTime.isBefore(pendingSince!.add(pendingDuration));
  }
}
