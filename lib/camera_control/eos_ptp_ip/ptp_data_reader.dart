import 'package:flutter/foundation.dart';

class PtpDataReader {
  final Uint8List _data;
  final ByteData _bytes;
  int offset = 0;

  PtpDataReader(this._data) : _bytes = ByteData.view(_data.buffer);

  int get length => _data.length;

  int getUint32() {
    final result = _bytes.getUint32(offset, Endian.little);
    offset += 4;
    return result;
  }

  int getUint16() {
    final result = _bytes.getUint16(offset, Endian.little);
    offset += 2;
    return result;
  }

  Uint8List getBytes(int count) {
    final bytes = _data.sublist(offset, offset + count);
    offset += count;
    return bytes;
  }

  String getString() {
    final charCodes = <int>[];

    while (offset < length) {
      var char = getUint16();
      if (char == 0) {
        return String.fromCharCodes(charCodes);
      }
      charCodes.add(char);
    }

    throw RangeError('Sequence was not null terminated');
  }
}
