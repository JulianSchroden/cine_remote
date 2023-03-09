import 'dart:typed_data';

import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_packet_reader.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/models/ptp_packet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PtpPacket buildPacket(List<int> data) {
    return PtpPacket(Uint8List.fromList(data));
  }

  group('getUint32', () {
    test('returns correct uint32 value', () {
      final packet = buildPacket([0x01, 0x02, 0x03, 0x04]);
      final reader = PtpPacketReader(packet);

      final result = reader.getUint32();

      expect(result, 0x04030201);
    });

    test('returns correct value when called in sequence', () {
      final packet =
          buildPacket([0x09, 0x08, 0x07, 0x06, 0x01, 0x02, 0x03, 0x04]);
      final reader = PtpPacketReader(packet);

      final value1 = reader.getUint32();
      final value2 = reader.getUint32();

      expect(value1, 0x06070809);
      expect(value2, 0x04030201);
    });

    test('throws RangeError when trying to read out of bounds bytes', () {
      final packet = buildPacket([]);
      final reader = PtpPacketReader(packet);

      expect(() => reader.getUint32(), throwsA(isA<RangeError>()));
    });
  });

  group('getUint16', () {
    test('should return correct uint16 value', () {
      final packet = buildPacket([0x01, 0x02]);
      final reader = PtpPacketReader(packet);

      final result = reader.getUint16();

      expect(result, 0x0201);
    });

    test('returns correct value when called in sequence', () {
      final packet = buildPacket([0x09, 0x08, 0x03, 0x04]);
      final reader = PtpPacketReader(packet);

      final value1 = reader.getUint16();
      final value2 = reader.getUint16();

      expect(value1, 0x0809);
      expect(value2, 0x0403);
    });

    test('throws RangeError when trying to read out of bounds bytes', () {
      final packet = buildPacket([]);
      final reader = PtpPacketReader(packet);

      expect(() => reader.getUint16(), throwsA(isA<RangeError>()));
    });
  });

  group('getBytes', () {
    test('returns correct list of bytes', () {
      final packet = buildPacket([0x01, 0x02, 0x03, 0x04, 0x05]);
      final reader = PtpPacketReader(packet);

      final result = reader.getBytes(3);

      expect(result, Uint8List.fromList([0x01, 0x02, 0x03]));
    });

    test('returns correct value when called in sequence', () {
      final packet = buildPacket([0x01, 0x02, 0x03, 0x04, 0x05]);
      final reader = PtpPacketReader(packet);

      final result1 = reader.getBytes(2);
      final result2 = reader.getBytes(2);

      expect(result1, Uint8List.fromList([0x01, 0x02]));
      expect(result2, Uint8List.fromList([0x03, 0x04]));
    });

    test('throws RangeError when trying to read out of bounds bytes', () {
      final packet = buildPacket([0x01, 0x02, 0x03]);
      final reader = PtpPacketReader(packet);

      expect(() => reader.getBytes(5), throwsA(isA<RangeError>()));
    });
  });

  group('getString', () {
    test('should return correct string', () {
      final packet = buildPacket([
        0x48,
        0x000,
        0x65,
        0x00,
        0x6c,
        0x00,
        0x6c,
        0x0,
        0x6f,
        0x0,
        0x0,
        0x0
      ]);
      final reader = PtpPacketReader(packet);

      final result = reader.getString();
      expect(result, 'Hello');
    });

    test('returns correct value when called in sequence', () {
      final packet = buildPacket([
        0x48,
        0x00,
        0x65,
        0x00,
        0x79,
        0x00,
        0x00,
        0x00,
        0x59,
        0x00,
        0x6f,
        0x00,
        0x75,
        0x00,
        0x00,
        0x00
      ]);
      final reader = PtpPacketReader(packet);

      final result1 = reader.getString();
      final result2 = reader.getString();
      expect(result1, 'Hey');
      expect(result2, 'You');
    });

    test('throws when sequence is not null terminated', () {
      final packet = buildPacket([
        0x48,
        0x00,
        0x65,
        0x00,
        0x79,
        0x00,
      ]);

      final reader = PtpPacketReader(packet);
      expect(() => reader.getString(), throwsA(isA<RangeError>()));
    });
  });
}
