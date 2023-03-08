import 'dart:typed_data';

import 'extensions/to_byte_extensions.dart';

class PtpDataBuilder {
  final BytesBuilder _builder;

  PtpDataBuilder() : _builder = BytesBuilder();

  PtpDataBuilder add(List<int> bytes) {
    _builder.add(bytes);
    return this;
  }

  PtpDataBuilder addUInt32(int value) {
    _builder.add(value.asUint32Bytes());
    return this;
  }

  PtpDataBuilder addUInt16(int value) {
    _builder.add(value.asUint16Bytes());
    return this;
  }

  PtpDataBuilder addString(String value) {
    _builder.add(value.asUtf16Bytes());
    return this;
  }

  Uint8List build() {
    final bytes = _builder.takeBytes();
    final length = bytes.length + 4;
    _builder.add(length.asUint32Bytes());
    _builder.add(bytes);

    return _builder.takeBytes();
  }
}
