import '../../interface/models/control_prop_type.dart';
import '../communication/ptp_transaction_queue.dart';
import '../constants/ptp_property.dart';
import '../extensions/int_as_hex_string_extension.dart';
import '../extensions/to_byte_extensions.dart';
import '../models/eos_ptp_int_prop_value.dart';
import 'action.dart';

class SetPropAction extends Action<void> {
  final ControlPropType propType;
  final EosPtpIntPropValue propValue;

  SetPropAction(this.propType, this.propValue, [super.operationFactory]);

  @override
  Future<void> run(PtpTransactionQueue transactionQueue) async {
    final propCode = mapPropTypeToCode(propType);
    final nativeValue = propValue.nativeValue;
    if (propCode == null) {
      throw Error();
    }

    logger.info(
        'Setting property ${propCode.asHex()} to ${nativeValue.asHex()} ($nativeValue)');

    final valueBytes = nativeValue.asUint32Bytes();
    final setPropValue = operationFactory.createSetPropValue(
      propCode,
      valueBytes,
    );
    await transactionQueue.handle(setPropValue);
  }
}
