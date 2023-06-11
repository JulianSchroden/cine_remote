import '../../../interface/models/control_prop_type.dart';
import '../../models/eos_ptp_int_prop_value.dart';
import 'ptp_event.dart';

class PropValueChanged extends PtpEvent {
  final int propCode;
  final ControlPropType? propType;
  final EosPtpIntPropValue propValue;

  const PropValueChanged(this.propCode, this.propType, this.propValue);

  @override
  List<Object?> get props => [propType, propValue];
}
