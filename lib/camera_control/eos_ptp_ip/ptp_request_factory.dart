import 'dart:typed_data';

import 'ptp_data_builder.dart';
import 'ptp_package_typ.dart';
import 'ptp_packet.dart';

class PtpRequestFactory {
  PtpPacket createInitRequest({
    required String name,
    required Uint8List guid,
    int version = 1,
  }) {
    final builder = PtpDataBuilder();
    builder.addUInt32(PtpPacketTyp.initRequest);
    builder.add(guid);
    builder.addString(name);
    builder.addUInt32(version);
    return PtpPacket(builder.build());
  }
}
