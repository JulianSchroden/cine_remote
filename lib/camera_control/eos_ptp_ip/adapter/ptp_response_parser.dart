import 'dart:typed_data';

import 'package:logging/logging.dart';

import '../constants/ptp_package_typ.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_init_command_response.dart';
import '../responses/ptp_init_event_response.dart';
import '../responses/ptp_operation_response.dart';
import '../responses/ptp_response.dart';
import '../responses/ptp_start_data_response.dart';
import 'ptp_packet_reader.dart';

class PtpResponseParser {
  const PtpResponseParser();

  PtpResponse? read(PtpPacket packet) {
    final logger = Logger('PtpResponseParser');
    final reader = PtpPacketReader(packet);
    if (reader.length < 8) {
      logger.warning('Packet length invalid');
      return null;
    }

    final payloadLength = reader.getUint32();
    if (payloadLength > reader.length) {
      logger.warning(
          'payloadLength $payloadLength is smaller than data.length ${reader.length}');
      return null;
    }

    final packetType = reader.getUint32();

    logger.info('Packet type is: $packetType');

    switch (packetType) {
      case PtpPacketTyp.initCommandAck:
        return parseInitAckReponse(reader);

      case PtpPacketTyp.initEventAck:
        return PtpInitEventResponse();

      case PtpPacketTyp.operationResponse:
        return parseOperationResponse(reader);

      case PtpPacketTyp.startDataPacket:
        return parseStartDataResponse(reader);
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

  PtpOperationResponse parseOperationResponse(PtpPacketReader reader) {
    final responseCode = reader.getUint16();
    final transactionId = reader.getUint32();

    return PtpOperationResponse(responseCode, transactionId, Uint8List(0));
  }

  PtpStartDataResponse parseStartDataResponse(PtpPacketReader reader) {
    final transactionId = reader.getUint32();
    final dataLength = reader.getUint32();

    final logger = Logger('PtpResponseParser');
    logger.info(
        'parseStartDataResponse: transactionId: $transactionId, dataLength: $dataLength');

    return PtpStartDataResponse(transactionId, dataLength);
  }
}
