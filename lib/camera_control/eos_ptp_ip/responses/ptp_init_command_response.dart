import 'dart:typed_data';

import 'ptp_response.dart';

class PtpInitCommandResponse extends PtpResponse {
  final int connectionNumber;
  final Uint8List cameraGuid;
  final String cameraName;
  final String version;

  const PtpInitCommandResponse({
    required this.connectionNumber,
    required this.cameraGuid,
    required this.cameraName,
    required this.version,
  });

  @override
  List<Object?> get props => [
        connectionNumber,
        cameraGuid,
        cameraName,
        version,
      ];
}
