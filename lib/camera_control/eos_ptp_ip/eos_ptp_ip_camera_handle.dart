import 'dart:io';
import 'dart:typed_data';

import '../interface/models/camera_handle.dart';

class EosPtpIpCameraHandle extends CameraHandle {
  final Uint8List guid;
  final InternetAddress address;
  final String clientName;

  const EosPtpIpCameraHandle({
    required this.guid,
    required this.address,
    required this.clientName,
  });
}
