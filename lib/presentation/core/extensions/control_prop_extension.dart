import 'package:camera_control_dart/camera_control_dart.dart';

extension FormatControlPropExtension on ControlProp {
  String format() {
    switch (type) {
      case ControlPropType.iso:
        return 'ISO $currentValue';
      case ControlPropType.aperture:
        return 'F$currentValue';
      case ControlPropType.shutterAngle:
        return '$currentValue°';
      case ControlPropType.shutterSpeed:
        return '$currentValue';
      case ControlPropType.whiteBalance:
        return '${currentValue}K';
    }
  }
}

extension ControlPropIsPending on ControlProp {
  bool isWithinPendingTime(DateTime currentTime, Duration pendingDuration) {
    if (pendingSince == null) return false;

    return currentTime.isBefore(pendingSince!.add(pendingDuration));
  }
}
