import 'ptp_event.dart';
import '../../../interface/models/control_prop_type.dart';
import '../../../interface/models/control_prop_value.dart';

class PropValueChanged extends PtpEvent {
  final ControlPropType? propType;
  final int propertyCode;
  final ControlPropValue propValue;

  const PropValueChanged(this.propType, this.propertyCode, this.propValue);

  @override
  List<Object?> get props => [propType, propValue];
}
