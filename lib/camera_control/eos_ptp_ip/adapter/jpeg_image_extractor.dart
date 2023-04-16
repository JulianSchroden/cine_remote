import 'dart:typed_data';

import '../../common/extensions/list_extensions.dart';

class JpegImageExtractor {
  static const jpegStartMarker = [0xff, 0xd8, 0xff];
  static const jpegEndMarker = [0xff, 0xd9];

  const JpegImageExtractor();

  Uint8List? extractFromBytes(Uint8List bytes) {
    final startIndex = findStartMarker(bytes);
    final endIndex = findEndMarker(bytes);

    if (startIndex == -1 || endIndex == -1) {
      return null;
    }

    return bytes.sublist(startIndex, endIndex);
  }

  int findStartMarker(Uint8List imageBytes) {
    return imageBytes.indexOfSequence(jpegStartMarker);
  }

  int findEndMarker(Uint8List imageBytes) {
    final startOfEndMarker = imageBytes.lastIndexOfSequence(jpegEndMarker);

    if (startOfEndMarker == -1) {
      return -1;
    }

    return startOfEndMarker + jpegEndMarker.length;
  }
}
