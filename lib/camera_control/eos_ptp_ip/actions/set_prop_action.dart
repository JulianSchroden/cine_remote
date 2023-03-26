import '../../interface/models/control_prop_type.dart';
import '../communication/ptp_transaction_queue.dart';
import '../constants/ptp_property.dart';
import '../extensions/to_byte_extensions.dart';
import '../models/eos_ptp_prop_value.dart';
import 'action.dart';

class SetPropAction extends Action<void> {
  final ControlPropType propType;
  final EosPtpPropValue propValue;

  SetPropAction(this.propType, this.propValue, [super.operationFactory]);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    final propCode = mapPropTypeToCode(propType);
    if (propCode == null) {
      throw Error();
    }

    logger.info('Setting property $propCode to ${propValue.nativeValue}');

    final valueBytes = propValue.nativeValue.asUint32Bytes();
    final setPropValue = operationFactory.createSetPropValue(
      propCode,
      valueBytes,
    );
    await transactionQueue.handle(setPropValue);
  }
}
