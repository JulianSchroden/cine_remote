import 'package:flutter/foundation.dart';

import 'ptp_data_reader.dart';
import 'ptp_package_typ.dart';
import 'responses/ptp_init_ack_response.dart';
import 'responses/ptp_response.dart';

class PtpResponseReader {
  PtpResponse? read(Uint8List data) {
    final reader = PtpDataReader(data);
    if (reader.length < 8) {
      return null;
    }

    final payloadLength = reader.getUint32();
    if (payloadLength != data.length) {
      return null;
    }

    final packetType = reader.getUint32();

    switch (packetType) {
      case PtpPacketTyp.initAck:
        {
          return parseInitAckReponse(reader);
        }
    }
  }

  PtpInitAckResponse parseInitAckReponse(PtpDataReader reader) {
    final connectionNumber = reader.getUint32();
    final cameraGuid = reader.getBytes(16);
    final cameraName = reader.getString();
    final versionMinor = reader.getUint16();
    final versionMayor = reader.getUint16();

    return PtpInitAckResponse(
      connectionNumber: connectionNumber,
      cameraGuid: cameraGuid,
      cameraName: cameraName,
      version: '$versionMayor.$versionMinor',
    );
  }
}
