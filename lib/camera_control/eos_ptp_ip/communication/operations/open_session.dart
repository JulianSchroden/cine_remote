import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_operation_code.dart';
import 'ptp_operation.dart';

class OpenSession extends PtpRequestOperation {
  final int sessionId;

  const OpenSession(this.sessionId) : super(PtpOperationCode.openSession);

  @override
  void preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(sessionId);
  }
}
