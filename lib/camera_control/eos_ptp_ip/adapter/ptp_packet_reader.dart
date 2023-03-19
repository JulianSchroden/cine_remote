import 'package:flutter/foundation.dart';

import '../models/ptp_packet.dart';

class PtpPacketReader {
  final PtpPacket _packet;
  final ByteData _bytes;
  int offset = 0;

  PtpPacketReader(this._packet) : _bytes = ByteData.view(_packet.data.buffer);

  int get length => _packet.data.length;

  int get consumedBytes => offset;
  int get unconsumedBytes => length - offset;

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
    final bytes = _packet.data.sublist(offset, offset + count);
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
