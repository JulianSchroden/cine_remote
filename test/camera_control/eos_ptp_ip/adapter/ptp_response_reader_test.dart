import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_response_parser.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/models/ptp_packet.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/responses/ptp_init_command_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('initAckResponse', () {
    test('returns parsed reponse model', () {
      final packet = PtpPacket(Uint8List.fromList([
        0x28,
        0x00,
        0x00,
        0x00,
        0x02,
        0x00,
        0x00,
        0x00,
        0x01,
        0x00,
        0x00,
        0x00,
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
        0x32,
        0xa1,
        0xc2,
        0x54,
        0x37,
        0x00,
        0x30,
        0x00,
        0x44,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x01,
        0x00,
      ]));

      final reader = PtpResponseParser();
      final response = reader.read(packet);
      expect(response, isNotNull);
      expect(response, isA<PtpInitCommandResponse>());
      expect(
        response,
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
              0x32,
              0xa1,
              0xc2,
              0x54,
            ]),
            cameraName: "70D",
            version: '1.0'),
      );
    });
  });
}
