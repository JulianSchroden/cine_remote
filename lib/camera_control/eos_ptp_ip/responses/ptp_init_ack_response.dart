import 'package:flutter/foundation.dart';

import 'ptp_response.dart';

class PtpInitAckResponse extends PtpResponse {
  final int connectionNumber;
  final Uint8List cameraGuid;
  final String cameraName;
  final String version;

  PtpInitAckResponse({
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
