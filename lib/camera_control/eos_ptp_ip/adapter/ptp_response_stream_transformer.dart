import 'dart:async';
import 'dart:typed_data';

import '../constants/ptp_package_type.dart';
import '../responses/ptp_data_response.dart';
import '../responses/ptp_end_data_response.dart';
import '../responses/ptp_init_command_response.dart';
import '../responses/ptp_init_event_response.dart';
import '../responses/ptp_operation_response.dart';
import '../responses/ptp_response.dart';
import '../responses/ptp_start_data_response.dart';
import 'ptp_packet_reader.dart';

class PtpResponseStreamTransformer
    extends StreamTransformerBase<Uint8List, PtpResponse> {
  const PtpResponseStreamTransformer();

  @override
  Stream<PtpResponse> bind(Stream<Uint8List> stream) {
    final controller = StreamController<PtpResponse>();
    final bufferBuilder = BytesBuilder();
    final dataPacketMode = PtpDataPacketMode();

    controller.onListen = () {
      var subscription = stream.listen(null);
      subscription
        ..onData((data) {
          bufferBuilder.add(data);

          final buffer = Uint8List.fromList(bufferBuilder.takeBytes());

          final parserResult = parseResponseData(
            buffer,
            dataPacketMode,
          );

          for (final response in parserResult.responses) {
            controller.add(response);
          }

          if (buffer.length > parserResult.consumedBytes) {
            final remainingBytes = buffer.sublist(parserResult.consumedBytes);
            bufferBuilder.add(remainingBytes);
          }
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

  ParserResult parseResponseData(
    Uint8List data,
    PtpDataPacketMode dataPacketMode,
  ) {
    final reader = PtpPacketReader.fromBytes(data);

    final responses = <PtpResponse>[];
    while (reader.unconsumedBytes >= 8) {
      if (!reader.hasValidSegment()) {
        break;
      }

      final segmentReader = reader.readSegment();
      final packetType = segmentReader.getUint32();

      switch (packetType) {
        case PtpPacketType.initCommandAck:
          responses.add(parseInitAckReponse(segmentReader));
          break;
        case PtpPacketType.initEventAck:
          responses.add(PtpInitEventResponse());
          break;
        case PtpPacketType.operationResponse:
          responses.add(parseOperationResponse(
            segmentReader,
            dataPacketMode.takeBytes(),
          ));
          break;
        case PtpPacketType.startDataPacket:
          final startDataPacket = parseStartDataResponse(segmentReader);
          dataPacketMode.start(startDataPacket.totalLength);
          break;
        case PtpPacketType.dataPacket:
          final dataPacket = parseDataResponse(segmentReader);
          dataPacketMode.addBytes(dataPacket.data);
          break;
        case PtpPacketType.endDataPacket:
          final endDataPacket = parseEndDataResponse(segmentReader);

          dataPacketMode.finish(endDataPacket.data);
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

  PtpOperationResponse parseOperationResponse(
    PtpPacketReader reader,
    Uint8List dataPacketBytes,
  ) {
    final responseCode = reader.getUint16();
    final transactionId = reader.getUint32();

    return PtpOperationResponse(responseCode, transactionId, dataPacketBytes);
  }

  PtpStartDataResponse parseStartDataResponse(PtpPacketReader reader) {
    final transactionId = reader.getUint32();
    final dataLengthRaw = reader.getUint64();
    if (!dataLengthRaw.isValidInt) {
      throw RangeError('Did not expect to receive a length exceeding maxInt');
    }
    final dataLength = dataLengthRaw.toInt();

    return PtpStartDataResponse(transactionId, dataLength);
  }

  PtpDataResponse parseDataResponse(PtpPacketReader reader) {
    final transactionId = reader.getUint32();
    final data = reader.getRemainingBytes();

    return PtpDataResponse(transactionId, data);
  }

  PtpEndDataResponse parseEndDataResponse(PtpPacketReader reader) {
    final transactionId = reader.getUint32();
    final data = reader.getRemainingBytes();

    return PtpEndDataResponse(transactionId, data);
  }
}

class ParserResult {
  final int consumedBytes;
  final List<PtpResponse> responses;

  const ParserResult(this.consumedBytes, this.responses);
}

class PtpDataPacketMode {
  int _totalLength = 0;
  final _dataBuilder = BytesBuilder();

  int get totalLength => _totalLength;

  int get receivedBytes => _dataBuilder.length;

  void addBytes(Uint8List data) {
    _dataBuilder.add(data);
  }

  Uint8List takeBytes() {
    _totalLength = 0;
    return Uint8List.fromList(_dataBuilder.takeBytes());
  }

  void start(int totalLength) {
    _dataBuilder.clear();
    _totalLength = totalLength;
  }

  void finish(Uint8List data) {
    addBytes(data);
  }
}
