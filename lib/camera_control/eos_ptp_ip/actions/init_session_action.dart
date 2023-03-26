import '../communication/ptp_transaction_queue.dart';
import '../responses/ptp_operation_response.dart';
import '../responses/ptp_response.dart';
import 'action.dart';

class InitFailedException implements Exception {
  final String message;

  const InitFailedException(this.message);
}

class InitSessionAction extends Action<void> {
  InitSessionAction([super.operationFactory]);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    final openSession = operationFactory.createOpenSession(sessionId: 0x1);
    final openSessionResult = await transactionQueue.handle(openSession);
    verifyResponse(openSessionResult, 'openSession');

    final setRemoteMode = operationFactory.createSetRemoteMode();
    final setRemoteModeResponse = await transactionQueue.handle(setRemoteMode);
    verifyResponse(setRemoteModeResponse, 'setRemoteMode');

    final setEventMode = operationFactory.createSetEventMode();
    final setEventModeResponse = await transactionQueue.handle(setEventMode);
    verifyResponse(setEventModeResponse, 'setEventMode');
  }

  void verifyResponse(PtpResponse response, String operatioName) {
    if (response is! PtpOperationResponse) {
      throw InitFailedException(
          'Operation $operatioName failed. Received invalid response.');
    }

    if (response.isNotOkay) {
      throw InitFailedException(
          'Operation $operatioName failed with responseCode ${response.responseCode}.');
    }
  }
}
