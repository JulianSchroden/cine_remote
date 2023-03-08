import 'dart:typed_data';

extension IntToBytesExtension on int {
  Uint8List asUint32Bytes() {
    final bytes = ByteData(4);
    bytes.setUint32(0, this, Endian.little);
    return Uint8List.view(bytes.buffer);
  }

  Uint8List asUint16Bytes() {
    final bytes = ByteData(2);
    bytes.setUint16(0, this, Endian.little);
    return Uint8List.view(bytes.buffer);
  }
}

extension StringToBytesExtension on String {
  Uint8List asUtf16Bytes() {
    final characters = [...codeUnits, 0];
    final bytes = ByteData(characters.length * 2);
    for (var i = 0; i < characters.length; i++) {
      bytes.setUint16(i * 2, characters[i], Endian.little);
    }

    return Uint8List.view(bytes.buffer);
  }
}
