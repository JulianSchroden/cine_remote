import 'dart:typed_data';

import '../extensions/to_byte_extensions.dart';
import '../models/ptp_packet.dart';

class PtpPacketBuilder {
  final BytesBuilder _builder;

  PtpPacketBuilder() : _builder = BytesBuilder();

  PtpPacketBuilder add(List<int> bytes) {
    _builder.add(bytes);
    return this;
  }

  PtpPacketBuilder addUInt32(int value) {
    _builder.add(value.asUint32Bytes());
    return this;
  }

  PtpPacketBuilder addUInt16(int value) {
    _builder.add(value.asUint16Bytes());
    return this;
  }

  PtpPacketBuilder addString(String value) {
    _builder.add(value.asUtf16Bytes());
    return this;
  }

  PtpPacket build() {
    final bytes = _builder.takeBytes();
    final length = bytes.length + 4;
    _builder.add(length.asUint32Bytes());
    _builder.add(bytes);

    return PtpPacket(_builder.takeBytes());
  }
}
