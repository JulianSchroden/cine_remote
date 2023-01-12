import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension OrientationToDeviceOrientation on Orientation? {
  List<DeviceOrientation> toDeviceOrientations() {
    if (this == null) {
      return DeviceOrientation.values;
    } else if (this == Orientation.portrait) {
      return [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ];
    } else {
      return [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];
    }
  }
}
