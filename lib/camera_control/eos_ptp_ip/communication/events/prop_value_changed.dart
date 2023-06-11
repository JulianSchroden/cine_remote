import '../../../interface/models/control_prop_type.dart';
import '../../../interface/models/control_prop_value.dart';
import 'ptp_event.dart';

class PropValueChanged extends PtpEvent {
  final int propCode;
  final ControlPropType? propType;
  final ControlPropValue propValue;

  const PropValueChanged(this.propCode, this.propType, this.propValue);

  @override
  List<Object?> get props => [propType, propValue];
}
