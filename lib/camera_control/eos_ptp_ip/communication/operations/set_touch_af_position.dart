import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_operation_code.dart';
import '../../models/eos_autofocus_position.dart';
import 'ptp_operation.dart';

class SetTouchAfPosition extends PtpRequestOperation {
  final EosAutofocusPostion focusPosition;

  const SetTouchAfPosition(this.focusPosition)
      : super(PtpOperationCode.setTouchAfPosition);

  @override
  void preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(0x03);
    builder.addUInt32(focusPosition.x);
    builder.addUInt32(focusPosition.y);
  }
}
