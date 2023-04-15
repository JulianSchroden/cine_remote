import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_operation_code.dart';
import '../../constants/remote_mode.dart';
import 'ptp_operation.dart';

class SetRemoteMode extends PtpRequestOperation {
  final RemoteMode remoteMode;

  const SetRemoteMode(this.remoteMode) : super(PtpOperationCode.setRemoteMode);

  @override
  void preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(remoteMode.value);
  }
}
