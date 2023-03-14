import 'dart:async';

import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_operation_code.dart';
import '../../responses/ptp_operation_response.dart';
import '../../responses/ptp_response.dart';
import '../ptp_action.dart';

class SetEventModeAction extends PtpAction<void> {
  SetEventModeAction() : super(operationCode: PtpOperationCode.setEventMode);

  @override
  FutureOr<void> preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(0x01);
  }

  @override
  FutureOr<void> mapResponse(PtpResponse response) {
    if (response is PtpOperationResponse) {
      logger.info(
          'Received setEventMode result: 0x${response.responseCode.toRadixString(16)}');
    }
  }
}
