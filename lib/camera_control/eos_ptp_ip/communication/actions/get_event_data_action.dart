import 'dart:async';

import '../../adapter/ptp_event_data_parser.dart';
import '../../constants/ptp_operation_code.dart';
import '../../responses/ptp_operation_response.dart';
import '../../responses/ptp_response.dart';
import '../ptp_action.dart';

class GetEventDataAction extends PtpAction<void> {
  GetEventDataAction() : super(operationCode: PtpOperationCode.getEventData);

  @override
  FutureOr<void> mapResponse(PtpResponse response) async {
    if (response is PtpOperationResponse) {
      if (response.data.isEmpty) {
        logger.warning('Received empty event data response');
        return;
    }

      final parser = PtpEventDataParser();

      final groupedEvents = parser.parseEvents(response.data);
  }
}
}
