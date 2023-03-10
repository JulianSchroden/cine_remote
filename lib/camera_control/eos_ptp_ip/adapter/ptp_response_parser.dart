import '../constants/ptp_package_typ.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_init_command_response.dart';
import '../responses/ptp_init_event_response.dart';
import '../responses/ptp_response.dart';
import 'ptp_packet_reader.dart';

class PtpResponseParser {
  const PtpResponseParser();

  PtpResponse? read(PtpPacket packet) {
    final reader = PtpPacketReader(packet);
    if (reader.length < 8) {
      return null;
    }

    final payloadLength = reader.getUint32();
    if (payloadLength != reader.length) {
      return null;
    }

    final packetType = reader.getUint32();

    switch (packetType) {
      case PtpPacketTyp.initCommandAck:
        return parseInitAckReponse(reader);

      case PtpPacketTyp.initEventAck:
        return PtpInitEventResponse();
    }

    return null;
  }

  PtpInitCommandResponse parseInitAckReponse(PtpPacketReader reader) {
    final connectionNumber = reader.getUint32();
    final cameraGuid = reader.getBytes(16);
    final cameraName = reader.getString();
    final versionMinor = reader.getUint16();
    final versionMayor = reader.getUint16();

    return PtpInitCommandResponse(
      connectionNumber: connectionNumber,
      cameraGuid: cameraGuid,
      cameraName: cameraName,
      version: '$versionMayor.$versionMinor',
    );
  }
}
