import 'dart:async';

import '../../adapter/ptp_packet_builder.dart';
import '../../constants/ptp_operation_code.dart';
import '../../responses/ptp_operation_response.dart';
import '../ptp_action.dart';
import '../ptp_ip_client.dart';

class OpenSesionAction extends PtpAction<void> {
  final int sessionId;

  OpenSesionAction({
    required PtpIpClient client,
    required int transactionId,
    required this.sessionId,
  }) : super(
          client: client,
          operationCode: PtpOperationCode.openSession,
          transactionId: transactionId,
        );

  @override
  FutureOr<void> preparePayload(PtpPacketBuilder builder) {
    builder.addUInt32(sessionId);
  }

  @override
  FutureOr<void> mapResponse(PtpOperationResponse response) {
    logger.info(
        'Received openSession result: 0x${response.responseCode.toRadixString(16)}');
  }
}
