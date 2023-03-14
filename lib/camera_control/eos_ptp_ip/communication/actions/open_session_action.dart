import 'dart:async';

import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_operation_code.dart';
import '../../responses/ptp_response.dart';
import '../ptp_action.dart';

class OpenSesionAction extends PtpAction<void> {
  final int sessionId;

  OpenSesionAction({
    required this.sessionId,
  }) : super(operationCode: PtpOperationCode.openSession);

  @override
  FutureOr<void> preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(sessionId);
  }

  @override
  FutureOr<void> mapResponse(PtpResponse response) {
    logger.info('Received openSession result');
  }
}
