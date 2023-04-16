import 'dart:typed_data';

import 'package:cine_remote/camera_control/common/extensions/list_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../eos_ptp_ip/packet_helper.dart';

void main() {
  group('lastIndex', () {
    test('returns -1 when iterable is empty', () {
      final data = <int>[];

      expect(data.lastIndex, -1);
    });

    test('returns correct last index', () {
      final data = [0x01, 0x02, 0x03, 0x04];

      expect(data.lastIndex, 3);
    });
  });

  group('indexOfSequence', () {
    test('returns -1 when sequence is empty', () {
      final data = flattenBytes([0x01, 0x02]);

      final result = data.indexOfSequence([]);

      expect(result, -1);
    });

    test('returns -1 when list is empty', () {
      final data = Uint8List(0);

      final result = data.indexOfSequence([0x01, 0x02]);

      expect(result, -1);
    });

    test('returns -1 when data does not contain sequence', () {
      final data =
          flattenBytes([0x01, 0x02, 0xff, 0x03, 0x09, 0xd8, 0x02, 0xff]);

      final result = data.indexOfSequence([0xff, 0xd8, 0xff]);

      expect(result, -1);
    });

    test('returns correct index', () {
      final data = flattenBytes([
        0x01,
        0x02,
        0xff,
        0x00,
        [0xff, 0xd8, 0xff],
        0x04,
        0x05
      ]);
      final result = data.indexOfSequence([0xff, 0xd8, 0xff]);

      expect(result, 4);
    });

    test('returns index of first occurrence of sequence', () {
      final data = flattenBytes([
        0x01,
        [0xff, 0xd8, 0xff],
        0x04,
        0x05,
        [0xff, 0xd8, 0xff],
        0x06,
      ]);
      final result = data.indexOfSequence([0xff, 0xd8, 0xff]);

      expect(result, 1);
    });
  });

  group('lastIndexOfSequence', () {
    test('returns -1 when sequence is empty', () {
      final data = flattenBytes([0x01, 0x02]);

      final result = data.lastIndexOfSequence([]);

      expect(result, -1);
    });

    test('returns -1 when list is empty', () {
      final data = Uint8List(0);

      final result = data.lastIndexOfSequence([0x01, 0x02]);

      expect(result, -1);
    });

    test('returns -1 when data does not contain sequence', () {
      final data =
          flattenBytes([0x01, 0x02, 0xff, 0x03, 0x09, 0xd8, 0x02, 0xff]);

      final result = data.lastIndexOfSequence([0xff, 0xd8, 0xff]);

      expect(result, -1);
    });

    test('returns correct index', () {
      final data = flattenBytes([
        0x01,
        0xff,
        0x00,
        [0xff, 0xd8, 0xff],
        0x04,
        0xff,
        0x03,
      ]);
      final result = data.lastIndexOfSequence([0xff, 0xd8, 0xff]);

      expect(result, 3);
    });

    test('returns index of last occurrence of sequence', () {
      final data = flattenBytes([
        0x01,
        [0xff, 0xd8, 0xff],
        0x04,
        0xff,
        [0xff, 0xd8, 0xff],
        0xff,
      ]);
      final result = data.lastIndexOfSequence([0xff, 0xd8, 0xff]);

      expect(result, 6);
    });
  });
}
