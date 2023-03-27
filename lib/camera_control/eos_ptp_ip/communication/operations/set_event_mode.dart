import '../../adapter/ptp_packet_builder.dart';
import '../../constants/event_mode.dart';
import '../../constants/ptp_operation_code.dart';
import 'ptp_operation.dart';

class SetEventMode extends PtpRequestOperation {
  final EventMode eventMode;

  const SetEventMode(this.eventMode) : super(PtpOperationCode.setEventMode);

  @override
  void preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(eventMode.value);
  }
}
