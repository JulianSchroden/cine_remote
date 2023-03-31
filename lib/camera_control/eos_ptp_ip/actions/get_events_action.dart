import 'dart:async';

import '../adapter/ptp_event_data_parser.dart';
import '../communication/events/ptp_event.dart';
import '../communication/operations/ptp_operation.dart';
import '../communication/ptp_transaction_queue.dart';
import '../responses/ptp_operation_response.dart';
import '../responses/ptp_response.dart';
import 'action.dart';

class GetEventsAction extends Action<List<PtpEvent>> {
  GetEventsAction([super.operationFactory]);

  @override
  Future<List<PtpEvent>> run(PtpTransactionQueue transactionQueue) async {
    final getEventData = operationFactory.createGetEventData();
    final response = await transactionQueue.handleIfNotQueued(
        getEventData,
        (operation) =>
            operation is PtpRequestOperation &&
            operation.operationCode == getEventData.operationCode);

    if (response == null) {
      return [];
    }

    return mapResponse(response);
  }

  List<PtpEvent> mapResponse(PtpResponse response) {
    if (response is PtpOperationResponse) {
      if (response.data.isEmpty) {
        logger.warning('Received empty event data response');
        return [];
      }

      final parser = PtpEventDataParser();

      return parser.parseEvents(response.data);
    }

    return [];
  }
}
