import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_data_mode.dart';
import '../../constants/ptp_package_typ.dart';
import '../../models/ptp_packet.dart';

abstract class PtpOperation {
  final int operationCode;

  const PtpOperation(this.operationCode);
}

abstract class PtpRequestOperation extends PtpOperation {
  const PtpRequestOperation(super.operationCode);

  PtpPacket buildRequest(int transactionId) {
    final builder = PtpPacketBuilder();
    builder.addUInt32(PtpPacketTyp.operationRequest);
    builder.addUInt32(PtpDataMode.noData);
    builder.addUInt16(operationCode);
    builder.addUInt32(transactionId);

    preparePayload(builder);

    return builder.build();
  }

  void preparePayload(PtpPacketBuilder builder) {}
}
