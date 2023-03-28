import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/jpeg_image_extractor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../packet_helper.dart';

void main() {
  late JpegImageExtractor sut;

  setUp(() {
    sut = const JpegImageExtractor();
  });

  group('extractFromBytes', () {
    test('returns null when imageBytes empty', () {
      final result = sut.extractFromBytes(Uint8List(0));

      expect(result, isNull);
    });

    test('returns null when startMarker not present', () {
      final imageBytes = flattenBytes([
        0x01,
        0x02,
        0x03,
        0x04,
        [0xff, 0xd9],
        0x00,
        0x01,
      ]);

      final result = sut.extractFromBytes(imageBytes);

      expect(result, isNull);
    });
    test('returns null when endMarker not present', () {
      final imageBytes = flattenBytes([
        0x01,
        [0xff, 0xd8, 0xff],
        0x00,
        0x01,
      ]);

      final result = sut.extractFromBytes(imageBytes);

      expect(result, isNull);
    });

    test('returns imageyBytes when both markers present', () {
      final imageBytes = flattenBytes([
        0x01,
        0x02,
        [0xff, 0xd8, 0xff],
        0x03,
        0x04,
        0x5,
        [0xff, 0xd9],
        0x00,
        0x01,
      ]);

      final result = sut.extractFromBytes(imageBytes);

      expect(
        result,
        flattenBytes(
          [
            [0xff, 0xd8, 0xff],
            0x03,
            0x04,
            0x5,
            [0xff, 0xd9],
          ],
        ),
      );
    });

    test('returns imageBytes when markers located at start and end of bytes',
        () {
      final imageBytes = flattenBytes([
        [0xff, 0xd8, 0xff],
        0x03,
        0x04,
        0x5,
        [0xff, 0xd9],
      ]);

      final result = sut.extractFromBytes(imageBytes);

      expect(
        result,
        flattenBytes(
          [
            [0xff, 0xd8, 0xff],
            0x03,
            0x04,
            0x5,
            [0xff, 0xd9],
          ],
        ),
      );
    });
  });
}
