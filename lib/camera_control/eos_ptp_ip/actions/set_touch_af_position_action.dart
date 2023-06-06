import '../../interface/models/properties/autofocus_position.dart';
import '../communication/ptp_transaction_queue.dart';
import '../models/eos_autofocus_position.dart';
import '../models/eos_sensor_info.dart';
import 'action.dart';

class SetTouchAfPositionAction extends Action<void> {
  final AutofocusPosition focusPosition;
  final EosSensorInfo sensorInfo;

  SetTouchAfPositionAction(this.focusPosition, this.sensorInfo);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    final position = mapPosition(focusPosition, sensorInfo);
    print('Set AFposition to $position');
    final setTouchAfPosition =
        operationFactory.createSetTouchAfPosition(position);
    final response = await transactionQueue.handle(setTouchAfPosition);
    verifyOperationResponse(response, 'setTouchAfPosition($position)');
    // TODO:
    // start autofocus
    // stop autofocus
    // check autofokus events? green rectangle vs red rectangle
  }

  EosAutofocusPostion mapPosition(
      AutofocusPosition position, EosSensorInfo sensorInfo) {
    return EosAutofocusPostion(
      x: (position.x * sensorInfo.width).toInt(),
      y: (position.y * sensorInfo.height).toInt(),
    );
  }
}
