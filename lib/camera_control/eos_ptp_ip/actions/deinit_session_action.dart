import '../communication/ptp_transaction_queue.dart';
import '../constants/event_mode.dart';
import '../constants/remote_mode.dart';
import 'action.dart';

class DeinitSessionAction extends Action<void> {
  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    await _disableEventMode(transactionQueue);

    await _disableRemoteMode(transactionQueue);

    await _closeSession(transactionQueue);
  }

  Future<void> _disableEventMode(PtpTransactionQueue transactionQueue) async {
    final setEventMode =
        operationFactory.createSetEventMode(EventMode.disabled);
    final response = await transactionQueue.handle(setEventMode);
    verifyOperationResponse(response, 'setEventMode');
  }

  Future<void> _disableRemoteMode(PtpTransactionQueue transactionQueue) async {
    final setRemoteMode =
        operationFactory.createSetRemoteMode(RemoteMode.disabled);
    final response = await transactionQueue.handle(setRemoteMode);
    verifyOperationResponse(response, 'setRemoteMode');
  }

  Future<void> _closeSession(PtpTransactionQueue transactionQueue) async {
    final closeSession = operationFactory.createCloseSession();
    final response = await transactionQueue.handle(closeSession);
    verifyOperationResponse(response, 'closeSession');
  }
}
