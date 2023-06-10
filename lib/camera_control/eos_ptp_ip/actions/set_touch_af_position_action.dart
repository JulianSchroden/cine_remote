import '../../interface/models/properties/autofocus_position.dart';
import '../communication/ptp_transaction_queue.dart';
import '../constants/capture_phase.dart';
import '../models/eos_autofocus_position.dart';
import '../models/eos_sensor_info.dart';
import 'action.dart';

class SetTouchAfPositionAction extends Action<void> {
  final AutofocusPosition focusPosition;
  final EosSensorInfo sensorInfo;
  final Duration autofocusDuration;

  SetTouchAfPositionAction(
      this.focusPosition, this.sensorInfo, this.autofocusDuration);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    final position = mapPosition(focusPosition, sensorInfo);

    logger.info('SetTouchAfPosition to $position');

    final setTouchAfPosition =
        operationFactory.createSetTouchAfPosition(position);
    final response = await transactionQueue.handle(setTouchAfPosition);
    verifyOperationResponse(response, 'setTouchAfPosition($position)');

    await _initiateFocus(transactionQueue);
  }

  Future<void> _initiateFocus(PtpTransactionQueue transactionQueue) async {
    final startFocus =
        operationFactory.createStartImageCapture(CapturePhase.focus);
    final startFocusResponse = await transactionQueue.handle(startFocus);
    verifyOperationResponse(startFocusResponse, 'startFocus');

    await Future.delayed(const Duration(seconds: 1));

    final stopFocus =
        operationFactory.createStopImageCapture(CapturePhase.focus);
    final stopFocusResponse = await transactionQueue.handle(stopFocus);
    verifyOperationResponse(stopFocusResponse, 'stopFocus');
  }

  EosAutofocusPostion mapPosition(
    AutofocusPosition position,
    EosSensorInfo sensorInfo,
  ) {
    return EosAutofocusPostion(
      x: (position.x * sensorInfo.width).toInt(),
      y: (position.y * sensorInfo.height).toInt(),
    );
  }
}
