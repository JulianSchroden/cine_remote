import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_operation_code.dart';
import 'ptp_operation.dart';

class SetRemoteMode extends PtpRequestOperation {
  const SetRemoteMode() : super(PtpOperationCode.setRemoteMode);

  @override
  void preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(0x01);
  }
}
