import 'dart:typed_data';

import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_operation_code.dart';
import '../../models/ptp_packet.dart';
import 'ptp_operation.dart';

class SetPropValue extends PtpDataOperation {
  final int propCode;
  final Uint8List propValue;

  SetPropValue(this.propCode, this.propValue)
      : super(PtpOperationCode.setPropValue);

  @override
  PtpPacket buildData() {
    final builder = PtpPacketBuilder();
    builder.addUInt32(propCode);
    builder.add(propValue);
    return builder.build();
  }
}
