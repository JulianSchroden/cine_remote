import 'dart:typed_data';

class PtpPacket {
  final Uint8List data;

  PtpPacket(this.data);

  int get length => data.length;
}
