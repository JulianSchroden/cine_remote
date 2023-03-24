import 'ptp_event.dart';
import '../../../interface/models/control_prop_type.dart';
import '../../../interface/models/control_prop_value.dart';

class PropValueChanged extends PtpEvent {
  final ControlPropType propType;
  final ControlPropValue propValue;

  const PropValueChanged(this.propType, this.propValue);

  @override
  List<Object?> get props => [propType, propValue];
}
