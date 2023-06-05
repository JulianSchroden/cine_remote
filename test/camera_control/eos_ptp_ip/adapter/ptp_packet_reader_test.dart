import 'dart:typed_data';

import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_packet_reader.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/models/ptp_packet.dart';
import 'package:flutter_test/flutter_test.dart';

import '../packet_helper.dart';

void main() {
  group('hasValidSegment', () {
    test('throws RangeError when trying to read out of bounds bytes', () {
      final packetBytes = Uint8List(0);

      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(
        () => reader.hasValidSegment(),
        throwsA(isA<RangeError>()),
      );
    });

    test('returns true when segment bytes are available', () {
      final packetBytes = flattenBytes([
        [0x08, 0x00, 0x00, 0x00],
        [0x01, 0x02, 0x03, 0x04],
      ]);

      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(reader.hasValidSegment(), isTrue);
    });

    test('returns false when segment bytes not available', () {
      final packetBytes = flattenBytes([
        [0x08, 0x00, 0x00, 0x00],
      ]);

      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(reader.hasValidSegment(), isFalse);
    });
  });

  group('processSegment', () {
    test('throws RangeError when less then 4 bytes onconsumed', () {
      final packetBytes = Uint8List(0);

      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(
        () => reader.readSegment(),
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
        () => reader.readSegment(),
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

      final segmentReader = reader.readSegment();
      segmentReader.getUint32();
      expect(
        () => segmentReader.getUint32(),
        throwsA(isA<RangeError>()),
      );
    });

    test('skips onconsumed bytes', () {
      final packet = PtpPacket(flattenBytes([
        [0x08, 0x00, 0x00, 0x00], // segment 1: 8 bytes
        [0x01, 0x00, 0x02, 0x00],
        [0x0c, 0x00, 0x00, 0x00], // segment 2: 12 bytes
        [0x03, 0x04, 0x00, 0x00],
        [0x05, 0x06, 0x00, 0x00],
      ]));

      final reader = PtpPacketReader.fromPacket(packet);

      final segmentReader = reader.readSegment();
      final segmentValue = segmentReader.getUint16();

      expect(segmentValue, 0x01);
      expect(reader.consumedBytes, 8);
    });

    test('getBytes returns correct bytes when processing subsequent segment',
        () {
      final packet = PtpPacket(flattenBytes([
        [0x08, 0x00, 0x00, 0x00], // segment 1: 8 bytes
        [0x01, 0x00, 0x02, 0x00],
        [0x0c, 0x00, 0x00, 0x00], // segment 2: 12 bytes
        [0x03, 0x04, 0x00, 0x00],
        [0x05, 0x06, 0x00, 0x00],
        [0x08, 0x00, 0x00, 0x00], // segment 3: 8 bytes
        [0x03, 0x00, 0x00, 0x00],
      ]));

      final reader = PtpPacketReader.fromPacket(packet);
      reader.readSegment();
      expect(reader.consumedBytes, 8);

      final segmentReader = reader.readSegment();

      final segmentTwoValue = segmentReader.getUint32();
      final segmentTwoBytes = segmentReader.getBytes(4);

      expect(segmentTwoValue, 0x0403);
      expect(segmentTwoBytes, [0x05, 0x06, 0x00, 0x00]);
    });

    test('getRemainingBytes should respect bounds of current segment', () {
      final packet = PtpPacket(flattenBytes([
        [0x08, 0x00, 0x00, 0x00], // segment 1: 8 bytes
        [0x01, 0x00, 0x02, 0x00],
        [0x0c, 0x00, 0x00, 0x00], // segment 2: 12 bytes
        [0x03, 0x04],
        [0x33, 0x34],
        [0x05, 0x06, 0x00, 0x00],
        [0x08, 0x00, 0x00, 0x00], // segment 3: 8 bytes
        [0x03, 0x00, 0x00, 0x00],
      ]));

      final reader = PtpPacketReader.fromPacket(packet);
      reader.readSegment();
      expect(reader.consumedBytes, 8);

      final segmentReader = reader.readSegment();
      segmentReader.getUint16();
      final result = segmentReader.getRemainingBytes();

      expect(segmentReader.consumedBytes, 8);

      expect(result.length, 6);
      expect(
        result,
        flattenBytes(
          [
            [0x33, 0x34],
            [0x05, 0x06, 0x00, 0x00],
          ],
        ),
      );
      expect(reader.consumedBytes, 20);
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
    test('returns correct uint16 value', () {
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

  group('getUint8', () {
    test('returns correct uint8 value', () {
      final packetBytes = flattenBytes([
        [0x01, 0x02],
      ]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final result = reader.getUint8();

      expect(result, 0x01);
    });

    test('returns correct value when called in sequence', () {
      final packetBytes = flattenBytes([
        [0x09, 0x08],
        [0x03, 0x04],
      ]);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      final value1 = reader.getUint8();
      final value2 = reader.getUint8();

      expect(value1, 0x09);
      expect(value2, 0x08);
    });

    test('throws RangeError when trying to read out of bounds bytes', () {
      final packetBytes = Uint8List(0);
      final reader = PtpPacketReader.fromBytes(packetBytes);

      expect(() => reader.getUint8(), throwsA(isA<RangeError>()));
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

  group('getRemainingBytes', () {
    test('returns all bytes when none have been consumed', () {
      final packetBytes = flattenBytes([
        [0x01, 0x11],
        [0x02, 0x22],
        [0x03, 0x33],
        [0x04, 0x44],
      ]);

      final reader = PtpPacketReader.fromBytes(packetBytes);

      final result = reader.getRemainingBytes();
      expect(
        result,
        packetBytes,
      );
    });

    test('returns remaining bytes after reading value', () {
      final packetBytes = flattenBytes([
        [0x01, 0x11],
        [0x02, 0x22],
        [0x03, 0x33],
        [0x04, 0x44],
      ]);

      final reader = PtpPacketReader.fromBytes(packetBytes);
      reader.getUint16();

      final result = reader.getRemainingBytes();
      expect(
        result,
        flattenBytes(
          [
            [0x02, 0x22],
            [0x03, 0x33],
            [0x04, 0x44],
          ],
        ),
      );
    });
  });

  group('peekRemainingBytes', () {
    test('returns all bytes and does not change offset', () {
      final packetBytes = flattenBytes([
        [0x01, 0x11],
        [0x02, 0x22],
        [0x03, 0x33],
        [0x04, 0x44],
      ]);

      final reader = PtpPacketReader.fromBytes(packetBytes);

      final result = reader.peekRemainingBytes();
      expect(
        result,
        packetBytes,
      );
      expect(reader.consumedBytes, 0);
    });

    test(
        'returns remaining bytes after reading value and does not change offset',
        () {
      final packetBytes = flattenBytes([
        [0x01, 0x11],
        [0x02, 0x22],
        [0x03, 0x33],
        [0x04, 0x44],
      ]);

      final reader = PtpPacketReader.fromBytes(packetBytes);
      reader.getUint16();

      final result = reader.peekRemainingBytes();
      expect(
        result,
        flattenBytes(
          [
            [0x02, 0x22],
            [0x03, 0x33],
            [0x04, 0x44],
          ],
        ),
      );
      expect(reader.consumedBytes, 2);
    });
  });

  group('getString', () {
    test('returns parsed null terminated string', () {
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

    test('returns parsed strings when called in sequence', () {
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
