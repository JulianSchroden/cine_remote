import 'dart:typed_data';

import '../models/ptp_packet.dart';

class PtpPacketReader {
  final ByteData _bytes;
  int _offset = 0;

  PtpPacketReader(this._bytes);

  factory PtpPacketReader.fromPacket(PtpPacket packet) {
    return PtpPacketReader.fromBytes(packet.data);
  }

  factory PtpPacketReader.fromBytes(Uint8List bytes) {
    return PtpPacketReader(ByteData.view(bytes.buffer));
  }

  int get length => _bytes.lengthInBytes;

  int get consumedBytes => _offset;
  int get unconsumedBytes => length - _offset;

  bool hasValidSegment() {
    final segmentLength = _bytes.getUint32(_offset, Endian.little);
    return segmentLength <= unconsumedBytes;
  }

  PtpPacketReader readSegment() {
    final segmentLength = getUint32();
    final segmentDataLength = segmentLength - 4;

    if (segmentDataLength > unconsumedBytes) {
      throw RangeError(
          'Cannot process segment: Segment length $segmentDataLength exceeds unconsumedBytes $unconsumedBytes');
    }

    final segmentBytes = _bytes.buffer.asByteData(_offset, segmentDataLength);
    skipBytes(segmentDataLength);

    return PtpPacketReader(segmentBytes);
  }

  BigInt getUint64() {
    final lowBytesHex = _getUint32AsHex();
    final highBytesHex = _getUint32AsHex();
    final bytesAsHex = highBytesHex + lowBytesHex;

    return BigInt.parse(bytesAsHex, radix: 16);
  }

  int getUint32() {
    final result = _bytes.getUint32(_offset, Endian.little);
    _offset += 4;
    return result;
  }

  int getUint16() {
    final result = _bytes.getUint16(_offset, Endian.little);
    _offset += 2;
    return result;
  }

  int getUint8() {
    final result = _bytes.getUint8(_offset);
    _offset += 1;
    return result;
  }

  Uint8List getBytes(int count) {
    final currentOffset = _bytes.offsetInBytes + _offset;
    _offset += count;

    return Uint8List.view(
      _bytes.buffer,
      currentOffset,
      count,
    );
  }

  Uint8List getRemainingBytes() {
    final currentOffset = _bytes.offsetInBytes + _offset;

    final bytes = Uint8List.view(_bytes.buffer, currentOffset, unconsumedBytes);
    _offset += unconsumedBytes;

    return bytes;
  }

  Uint8List peekRemainingBytes() {
    final currentOffset = _bytes.offsetInBytes + _offset;

    return Uint8List.view(_bytes.buffer, currentOffset, unconsumedBytes);
  }

  String getString() {
    final charCodes = <int>[];

    while (_offset < length) {
      var char = getUint16();
      if (char == 0) {
        return String.fromCharCodes(charCodes);
      }
      charCodes.add(char);
    }

    throw RangeError('Sequence was not null terminated');
  }

  void skipBytes(int bytesToSkip) {
    if (bytesToSkip > unconsumedBytes) {
      throw RangeError(
          'Cannot skip $bytesToSkip bytes. There are only $unconsumedBytes bytes left.');
    }
    _offset += bytesToSkip;
  }

  String _getUint32AsHex() => getUint32().toRadixString(16).padLeft(8, '0');
}
