import 'dart:typed_data';

import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_response_stream_transformer.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_init_command_response.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_init_event_response.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_operation_response.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../packet_helper.dart';

void main() {
  late PtpResponseStreamTransformer sut;

  setUp(() {
    sut = const PtpResponseStreamTransformer();
  });

  test('maps initCommandAck bytes to response', () {
    final initCommandAckBytes = flattenBytes([
      [0x28, 0x00, 0x00, 0x00], // 0x28: length: 40 bytes
      [0x02, 0x00, 0x00, 0x00], // 0x02: init command ack package
      [0x01, 0x00, 0x00, 0x00], // 0x01: connection number:  1
      [
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x01,
        0x00,
        0x60,
        0x12,
        0x8b,
        0x7c,
        0xc2,
        0x40
      ], // camera guid
      [0x37, 0x00, 0x30, 0x00, 0x44, 0x00, 0x00, 0x00], // camera name
      [0x00, 0x00, 0x01, 0x00] // ptp version: 1.0
    ]);

    final inputStream = Stream.fromIterable([initCommandAckBytes]);
    final transformedStream = inputStream.transform<PtpResponse>(sut);

    expect(
      transformedStream,
      emitsInOrder(
        [
          PtpInitCommandResponse(
            connectionNumber: 1,
            cameraGuid: Uint8List.fromList([
              0x00,
              0x00,
              0x00,
              0x00,
              0x00,
              0x00,
              0x00,
              0x00,
              0x01,
              0x00,
              0x60,
              0x12,
              0x8b,
              0x7c,
              0xc2,
              0x40
            ]),
            cameraName: '70D',
            version: '1.0',
          )
        ],
      ),
    );
  });

  test('maps initEventAck bytes to response', () {
    final initEventAckBytes = flattenBytes([
      [0x08, 0x00, 0x00, 0x00], // length: 8 bytes
      [0x04, 0x00, 0x00, 0x00], // init event ack packet
    ]);
    final inputStream = Stream.fromIterable([initEventAckBytes]);

    final transformedStream = inputStream.transform(sut);

    expect(
      transformedStream,
      emitsInOrder(
        [
          isA<PtpInitEventResponse>(),
        ],
      ),
    );
  });

  test('maps operation response bytes to response', () {
    final operationResponseBytes = flattenBytes([
      [0x0e, 0x00, 0x00, 0x00], // length: 14 bytes
      [0x07, 0x00, 0x00, 0x00], // operation response packet
      [0x01, 0x20], // 0x2001: OK
      [0x06, 0x00, 0x00, 0x00] // transactionId: 0x06
    ]);
    final inputStream = Stream.fromIterable([operationResponseBytes]);

    final transformedStream = inputStream.transform(sut);

    expect(
      transformedStream,
      emitsInOrder(
        [
          PtpOperationResponse(
            0x2001,
            0x06,
            Uint8List(0),
          ),
        ],
      ),
    );
  });

  test('maps data packet to response', () {
    final startDataPacketResponseBytes = flattenBytes([
      // startDataPacket
      [0x14, 0x00, 0x00, 0x00], // length: 20
      [0x09, 0x00, 0x00, 0x00], // start data packet
      [0x09, 0x00, 0x00, 0x00], // transactionId: 0x09
      [0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00], // totalDataLength: 36
      // dataPacket
      [0x30, 0x00, 0x00, 0x00], // length: 48 bytes
      [0x0c, 0x00, 0x00, 0x00], // endDataPacket
      [0x09, 0x00, 0x00, 0x00], // transactionId: 0x09
    ]);

    final dataPacketBytes = Uint8List.fromList([
      0x04,
      0x00,
      0x03,
      0x00,
      0x00,
      0x00,
      0x00,
      0x00,
      0x1a,
      0x6d,
      0x07,
      0x00,
      0x00,
      0x00,
      0x00,
      0x80,
      0x5c,
      0xf0,
      0x04,
      0x00,
      0x00,
      0x00,
      0xff,
      0xff,
      0xff,
      0xff,
      0x03,
      0x53,
      0x00,
      0x44,
      0x00,
      0x00,
      0x00,
      0x00,
      0x00,
      0x00,
    ]);

    final operationResponseBytes = flattenBytes([
      [0x0e, 0x00, 0x00, 0x00], // length: 14 bytes
      [0x07, 0x00, 0x00, 0x00], // operation response packet
      [0x01, 0x20], // 0x2001 = OK
      [0x09, 0x00, 0x00, 0x00] // transactionId: 0x09
    ]);

    final inputStream = Stream.fromIterable([
      startDataPacketResponseBytes,
      dataPacketBytes,
      operationResponseBytes
    ]);
    final transformedStream = inputStream.transform(sut);

    expect(
      transformedStream,
      emitsInOrder(
        [
          PtpOperationResponse(
            0x2001,
            0x09,
            dataPacketBytes,
          ),
        ],
      ),
    );
  });
}
