import '../../../interface/models/control_prop_type.dart';
import '../../models/eos_ptp_int_prop_value.dart';
import 'ptp_event.dart';

class PropValueChanged extends PtpEvent {
  final ControlPropType? propType;
  final int propCode;
  final EosPtpIntPropValue propValue;

  const PropValueChanged(this.propType, this.propCode, this.propValue);

  @override
  List<Object?> get props => [propType, propValue];
}
