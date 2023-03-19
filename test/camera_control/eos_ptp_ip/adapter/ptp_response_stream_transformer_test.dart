import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_response_stream_transformer.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_init_command_response.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_init_event_response.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PtpResponseStreamTransformer sut;

  setUp(() {
    sut = const PtpResponseStreamTransformer();
  });

  test('maps initCommandAck bytes to response', () {
    final initCommandAckBytes = Uint8List.fromList([
      [0x28, 0x00, 0x00, 0x00], // 0x28: length = 40
      [0x02, 0x00, 0x00, 0x00], // 0x02: init command ack package
      [0x01, 0x00, 0x00, 0x00], // 0x01: connection number = 1
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
      [0x00, 0x00, 0x01, 0x00] // ptp version = 1.0
    ].expand((byte) => byte).toList());

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
    final initEventAckBytes = Uint8List.fromList([
      [0x08, 0x00, 0x00, 0x00], // length = 8
      [0x04, 0x00, 0x00, 0x00], // init event ack packet
    ].expand((byte) => byte).toList());
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
}
