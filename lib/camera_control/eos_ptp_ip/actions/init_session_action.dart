import '../communication/ptp_transaction_queue.dart';
import 'action.dart';

class InitFailedException implements Exception {
  final String message;

  const InitFailedException(this.message);
}

class InitSessionAction extends Action<void> {
  InitSessionAction([super.operationFactory]);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    await _openSession(transactionQueue);

    await _enableRemoteMode(transactionQueue);

    await _enableEventMode(transactionQueue);
  }

  Future<void> _openSession(PtpTransactionQueue transactionQueue) async {
    final openSession = operationFactory.createOpenSession(sessionId: 0x1);
    final response = await transactionQueue.handle(openSession);
    verifyOperationResponse(response, 'openSession');
  }

  Future<void> _enableRemoteMode(PtpTransactionQueue transactionQueue) async {
    final setRemoteMode = operationFactory.createSetRemoteMode();
    final response = await transactionQueue.handle(setRemoteMode);
    verifyOperationResponse(response, 'setRemoteMode');
  }

  Future<void> _enableEventMode(PtpTransactionQueue transactionQueue) async {
    final setEventMode = operationFactory.createSetEventMode();
    final response = await transactionQueue.handle(setEventMode);
    verifyOperationResponse(response, 'setEventMode');
  }
}
