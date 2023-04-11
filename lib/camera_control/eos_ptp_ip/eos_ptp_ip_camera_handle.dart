import 'dart:typed_data';

import '../interface/models/camera_handle.dart';

class EosPtpIpCameraHandle extends CameraHandle {
  final Uint8List guid;
  final String address;
  final String clientName;

  const EosPtpIpCameraHandle({
    required super.model,
    required this.guid,
    required this.address,
    required this.clientName,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        guid,
        address,
        clientName,
      ];
}
