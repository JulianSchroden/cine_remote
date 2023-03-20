import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_event_data_parser.dart';
import 'package:flutter_test/flutter_test.dart';

import '../packet_helper.dart';

void main() {
  late PtpEventDataParser sut;

  setUp(() {
    sut = PtpEventDataParser();
  });

  group('groupData', () {
    test('should parse data to grouped event data', () {
      final structuredBytes = [
        [
          0x10,
          0x00,
          0x00,
          0x00,
          0x89,
          0xc1,
          0x00,
          0x00,
          0x02,
          0xd1,
          0x00,
          0x00,
          0x5b,
          0x00,
          0x00,
          0x00
        ], // shutter speed changed to 1/20s
        [
          0x10,
          0x00,
          0x00,
          0x00,
          0x89,
          0xc1,
          0x00,
          0x00,
          0x01,
          0xd1,
          0x00,
          0x00,
          0x18,
          0x00,
          0x00,
          0x00
        ], // aperture changed to f2.0
        [0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00], // end event data
      ];

      final eventData = preparePacket(structuredBytes);

      final result = sut.groupData(eventData);

      expect(result, structuredBytes);
    });
  });
}
