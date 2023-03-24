import 'dart:typed_data';

import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_packet_reader.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/models/ptp_packet.dart';
import 'package:flutter_test/flutter_test.dart';

import '../packet_helper.dart';

void main() {
  group('processSegment', () {
    test('throws RangeError when less then 4 bytes onconsumed', () {
      final packetBytes = Uint8List(0);

      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(
        () => reader.processSegment((reader) {}),
        throwsA(isA<RangeError>()),
      );
    });

    test('throws RangeError when segment length exceeds data length', () {
      final packetBytes = flattenBytes([
        [0x10, 0x00, 0x00, 0x00], // segment 1: 16 bytes
        [0x01, 0x00, 0x02, 0x00],
        [0x03, 0x04, 0x00, 0x00],
      ]);

      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(
        () => reader.processSegment((reader) {}),
        throwsA(isA<RangeError>()),
      );
    });

    test('throws RangeError when operation would exceed segment length', () {
      final packetBytes = flattenBytes([
        [0x08, 0x00, 0x00, 0x00], // segment 1: 8 bytes
        [0x01, 0x00, 0x02, 0x00],
        [0x08, 0x00, 0x00, 0x00], // segment 2: 12 bytes
        [0x03, 0x04, 0x00, 0x00],
        [0x05, 0x06, 0x00, 0x00],
      ]);

      final reader = PtpPacketReader.fromBytes(packetBytes);

      reader.processSegment((reader) {
        reader.getUint32();
        expect(
          () => reader.getUint32(),
          throwsA(isA<RangeError>()),
        );
      });
    });

    test('skips onconsumed bytes', () {
      final packetBytes = PtpPacket(flattenBytes([
        [0x08, 0x00, 0x00, 0x00], // segment 1: 8 bytes
        [0x01, 0x00, 0x02, 0x00],
        [0x08, 0x00, 0x00, 0x00], // segment 2: 12 bytes
        [0x03, 0x04, 0x00, 0x00],
        [0x05, 0x06, 0x00, 0x00],
      ]));

      final reader = PtpPacketReader.fromPacket(packetBytes);
      var segmentValue = -1;
      reader.processSegment((reader) {
        segmentValue = reader.getUint16();
      });
      expect(segmentValue, 0x01);
      expect(reader.consumedBytes, 8);
    });
  });

  group('getUint64', () {
    test('returns correct uint64 value', () {
      final packetBytes = flattenBytes([
        [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08],
      ]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final result = reader.getUint64();

      expect(result, BigInt.from(0x0807060504030201));
    });

    test('throws RangeError when trying to read out of bounds bytes', () {
      final packetBytes = flattenBytes([
        [0x01, 0x02, 0x03, 0x04],
      ]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(() => reader.getUint64(), throwsA(isA<RangeError>()));
    });
  });

  group('getUint32', () {
    test('returns correct uint32 value', () {
      final packetBytes = flattenBytes([
        [0x01, 0x02, 0x03, 0x04]
      ]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final result = reader.getUint32();

      expect(result, 0x04030201);
    });

    test('returns correct value when called in sequence', () {
      final packetBytes = flattenBytes([
        [0x09, 0x08, 0x07, 0x06],
        [0x01, 0x02, 0x03, 0x04],
      ]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final value1 = reader.getUint32();
      final value2 = reader.getUint32();

      expect(value1, 0x06070809);
      expect(value2, 0x04030201);
    });

    test('throws RangeError when trying to read out of bounds bytes', () {
      final packetBytes = flattenBytes([]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(() => reader.getUint32(), throwsA(isA<RangeError>()));
    });
  });

  group('getUint16', () {
    test('should return correct uint16 value', () {
      final packetBytes = flattenBytes([
        [0x01, 0x02],
      ]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final result = reader.getUint16();

      expect(result, 0x0201);
    });

    test('returns correct value when called in sequence', () {
      final packetBytes = flattenBytes([
        [0x09, 0x08],
        [0x03, 0x04],
      ]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final value1 = reader.getUint16();
      final value2 = reader.getUint16();

      expect(value1, 0x0809);
      expect(value2, 0x0403);
    });

    test('throws RangeError when trying to read out of bounds bytes', () {
      final packetBytes = Uint8List(0);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(() => reader.getUint16(), throwsA(isA<RangeError>()));
    });
  });

  group('getBytes', () {
    test('returns correct list of bytes', () {
      final packetBytes = Uint8List.fromList([0x01, 0x02, 0x03, 0x04, 0x05]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final result = reader.getBytes(3);

      expect(result, Uint8List.fromList([0x01, 0x02, 0x03]));
    });

    test('returns correct value when called in sequence', () {
      final packetBytes = Uint8List.fromList([0x01, 0x02, 0x03, 0x04, 0x05]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final result1 = reader.getBytes(2);
      final result2 = reader.getBytes(2);

      expect(result1, Uint8List.fromList([0x01, 0x02]));
      expect(result2, Uint8List.fromList([0x03, 0x04]));
    });

    test('throws RangeError when trying to read out of bounds bytes', () {
      final packetBytes = Uint8List.fromList([0x01, 0x02, 0x03]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(() => reader.getBytes(5), throwsA(isA<RangeError>()));
    });
  });

  group('getString', () {
    test('should return correct string', () {
      final packetBytes = Uint8List.fromList([
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
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final result = reader.getString();
      expect(result, 'Hello');
    });

    test('returns correct value when called in sequence', () {
      final packetBytes = Uint8List.fromList([
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
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final result1 = reader.getString();
      final result2 = reader.getString();
      expect(result1, 'Hey');
      expect(result2, 'You');
    });

    test('throws when sequence is not null terminated', () {
      final packetBytes = Uint8List.fromList([
        0x48,
        0x00,
        0x65,
        0x00,
        0x79,
        0x00,
      ]);

      final reader = PtpPacketReader.fromBytes(packetBytes);
      expect(() => reader.getString(), throwsA(isA<RangeError>()));
    });
  });

  group('skipBytes', () {
    test('skips specified number of bytes', () {
      final packetBytes = Uint8List.fromList([0x01, 0x02, 0x03, 0x04]);

      final reader = PtpPacketReader.fromBytes(packetBytes);
      reader.skipBytes(2);

      expect(reader.consumedBytes, 2);
    });

    test('throws RangeError when skip operation would exceed bounds', () {
      final packetBytes = Uint8List.fromList([0x01, 0x02, 0x03, 0x04]);

      final reader = PtpPacketReader.fromBytes(packetBytes);
      expect(() => reader.skipBytes(6), throwsA(isA<RangeError>()));
    });
  });
}
