import 'dart:typed_data';

import '../adapter/ptp_packet_builder.dart';
import '../constants/ptp_package_type.dart';
import '../models/ptp_packet.dart';

class PtpRequestFactory {
  PtpPacket createInitCommandRequest({
    required String name,
    required Uint8List guid,
    int version = 1,
  }) {
    final builder = PtpPacketBuilder();
    builder.addUInt32(PtpPacketType.initCommandRequest);
    builder.add(guid);
    builder.addString(name);
    builder.addUInt32(version);
    return builder.build();
  }

  PtpPacket createInitEventRequest({required int connectionNumber}) {
    final builder = PtpPacketBuilder();
    builder.addUInt32(PtpPacketType.initEventRequest);
    builder.addUInt32(connectionNumber);
    return builder.build();
  }
}
