import 'dart:io';

import '../../domain/models/camera_handle.dart';

class WifiCameraHandle extends CameraHandle {
  List<Cookie> cookies;

  WifiCameraHandle({
    required this.cookies,
    required super.supportedProps,
  });
}
