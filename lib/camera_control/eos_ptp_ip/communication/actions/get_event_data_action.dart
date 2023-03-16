import 'dart:async';

import '../../constants/ptp_operation_code.dart';
import '../../responses/ptp_operation_response.dart';
import '../../responses/ptp_response.dart';
import '../ptp_action.dart';

class GetEventDataAction extends PtpAction<void> {
  GetEventDataAction() : super(operationCode: PtpOperationCode.getEventData);

  @override
  FutureOr<void> mapResponse(PtpResponse response) {
    if (response is PtpOperationResponse) {
      logger.info(
          'Received getEventData result: 0x${response.responseCode.toRadixString(16)}');
      logger.info('data contains ${response.data.length} bytes');
    }
  }
}
