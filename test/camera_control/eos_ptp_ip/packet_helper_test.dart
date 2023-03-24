import 'package:flutter_test/flutter_test.dart';

import 'packet_helper.dart';

void main() {
  group('flattenBytes', () {
    test('returns one dimensional list as passed in', () {
      final bytes = [0x00, 0x01, 0x02];

      final result = flattenBytes(bytes);

      expect(result, bytes);
    });

    test('returns two dimensional list flattened', () {
      final structuredBytes = [
        [0x01, 0x00],
        [0x02, 0x00],
      ];

      final result = flattenBytes(structuredBytes);
      expect(result, [0x01, 0x00, 0x02, 0x00]);
    });

    test('returns three dimensional list flattened', () {
      final structuredBytes = [
        [
          [0x01, 0x00],
          [0x02, 0x00],
        ],
        [
          [0x03, 0x00],
          [0x04, 0x00],
        ]
      ];

      final result = flattenBytes(structuredBytes);
      expect(result, [0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00]);
    });
  });
}
