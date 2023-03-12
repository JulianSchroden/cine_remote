import 'dart:io';
import 'dart:typed_data';

import '../interface/models/camera_descriptor.dart';

class EosPtpIpCameraDescriptor extends CameraDescriptor {
  final Uint8List guid;
  final InternetAddress address;
  final String clientName;

  const EosPtpIpCameraDescriptor({
    required this.guid,
    required this.address,
    required this.clientName,
  });
}
