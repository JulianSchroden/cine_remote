import '../communication/ptp_transaction_queue.dart';
import '../constants/capture_destination.dart';
import '../constants/event_mode.dart';
import '../constants/ptp_property.dart';
import '../constants/remote_mode.dart';
import '../extensions/to_byte_extensions.dart';
import 'action.dart';

class InitSessionAction extends Action<void> {
  InitSessionAction([super.operationFactory]);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    await _openSession(transactionQueue);

    await _enableRemoteMode(transactionQueue);

    await _enableEventMode(transactionQueue);

    await _setCaptureDestination(transactionQueue, CaptureDestination.storage2);
  }

  Future<void> _openSession(PtpTransactionQueue transactionQueue) async {
    final openSession = operationFactory.createOpenSession(sessionId: 0x1);
    final response = await transactionQueue.handle(openSession);
    verifyOperationResponse(response, 'openSession');
  }

  Future<void> _enableRemoteMode(PtpTransactionQueue transactionQueue) async {
    final setRemoteMode =
        operationFactory.createSetRemoteMode(RemoteMode.enabled);
    final response = await transactionQueue.handle(setRemoteMode);
    verifyOperationResponse(response, 'setRemoteMode');
  }

  Future<void> _enableEventMode(PtpTransactionQueue transactionQueue) async {
    final setEventMode = operationFactory.createSetEventMode(EventMode.enabled);
    final response = await transactionQueue.handle(setEventMode);
    verifyOperationResponse(response, 'setEventMode');
  }

  Future<void> _setCaptureDestination(
    PtpTransactionQueue transactionQueue,
    CaptureDestination captureDestination,
  ) async {
    final setCaptureDestination = operationFactory.createSetPropValue(
      PtpPropertyCode.captureDestination,
      captureDestination.value.asUint32Bytes(),
    );
    final response = await transactionQueue.handle(setCaptureDestination);
    verifyOperationResponse(response, 'setCaptureDestination');
  }
}
