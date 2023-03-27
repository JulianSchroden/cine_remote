import '../communication/ptp_transaction_queue.dart';
import '../constants/capture_phase.dart';
import 'action.dart';

class CaptureImageAction extends Action<void> {
  CaptureImageAction([super.operationFactory]);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    await _startFocus(transactionQueue);
    await _startRelease(transactionQueue);

    await _stopRelease(transactionQueue);
    await _stopFocus(transactionQueue);
  }

  Future<void> _startFocus(PtpTransactionQueue transactionQueue) async {
    final startFocus =
        operationFactory.createStartImageCapture(CapturePhase.focus);
    final response = await transactionQueue.handle(startFocus);
    verifyOperationResponse(response, 'startImageCapture(focus)');
  }

  Future<void> _startRelease(PtpTransactionQueue transactionQueue) async {
    final startRelease =
        operationFactory.createStartImageCapture(CapturePhase.release);
    final response = await transactionQueue.handle(startRelease);
    verifyOperationResponse(response, 'startImageCapture(release)');
  }

  Future<void> _stopRelease(PtpTransactionQueue transactionQueue) async {
    final stopRelease =
        operationFactory.createStopImageCapture(CapturePhase.release);
    final response = await transactionQueue.handle(stopRelease);
    verifyOperationResponse(response, 'stopImageCapture(release)');
  }

  Future<void> _stopFocus(PtpTransactionQueue transactionQueue) async {
    final stopFocus =
        operationFactory.createStopImageCapture(CapturePhase.focus);
    final response = await transactionQueue.handle(stopFocus);
    verifyOperationResponse(response, 'stopImageCapture(focus)');
  }
}
