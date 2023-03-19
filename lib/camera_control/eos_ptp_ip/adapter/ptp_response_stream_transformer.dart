import 'dart:async';
import 'dart:typed_data';

import 'ptp_packet_reader.dart';
import 'package:logging/logging.dart';

import '../constants/ptp_package_typ.dart';
import '../models/ptp_packet.dart';
import '../responses/ptp_init_command_response.dart';
import '../responses/ptp_init_event_response.dart';
import '../responses/ptp_response.dart';
import 'ptp_response_parser.dart';

class PtpResponseStreamTransformer
    extends StreamTransformerBase<Uint8List, PtpResponse> {
  final PtpResponseParser _responseParser;

  const PtpResponseStreamTransformer([
    this._responseParser = const PtpResponseParser(),
  ]);

  @override
  Stream<PtpResponse> bind(Stream<Uint8List> stream) {
    final controller = StreamController<PtpResponse>();
    final BytesBuilder bufferBuilder = BytesBuilder();
    final dataMode = PtpDataMode();

    controller.onListen = () {
      var subscription = stream.listen(null);
      subscription
        ..onData((data) {
          bufferBuilder.add(data);

          final buffer = bufferBuilder.takeBytes();

          final parserResult = parseResponseData(buffer, dataMode);
          for (final response in parserResult.responses) {
            controller.add(response);
          }

          final remainingBytes = buffer.sublist(parserResult.consumedBytes);
          bufferBuilder.add(remainingBytes);
        })
        ..onError((Object error, StackTrace stackTrace) {
          controller.addError(error, stackTrace);
        })
        ..onDone(() {
          controller.close();
        });

      controller.onCancel = () {
        return subscription.cancel();
      };

      controller.onPause = () {
        subscription.pause();
      };
      controller.onResume = () {
        subscription.resume();
      };
    };

    return controller.stream;
  }

  ParserResult parseResponseData(Uint8List data, PtpDataMode dataMode) {
    final logger = Logger('PtpResponseTransformer');
    final reader = PtpPacketReader(PtpPacket(data));

    final responses = <PtpResponse>[];
    while (reader.unconsumedBytes >= 8) {
      // if waitsForEventData()
      // if event mode
      // check if reader.unconsumedBytes >= totalBytes
      //

      final payloadLength = reader.getUint32();
      if (payloadLength > reader.length) {
        logger.warning(
            'payloadLength $payloadLength is smaller than data.length ${reader.length}');
        break;
      }

      final packetType = reader.getUint32();
      logger.info('Packet type is: $packetType');

      switch (packetType) {
        case PtpPacketTyp.initCommandAck:
          responses.add(parseInitAckReponse(reader));
          break;
        case PtpPacketTyp.initEventAck:
          responses.add(PtpInitEventResponse());
          break;
      }
    }

    return ParserResult(reader.consumedBytes, responses);
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

class ParserResult {
  final int consumedBytes;
  final List<PtpResponse> responses;

  const ParserResult(this.consumedBytes, this.responses);
}

class PtpDataMode {
  bool isActive = false;
  int totalLength = 0;
}
