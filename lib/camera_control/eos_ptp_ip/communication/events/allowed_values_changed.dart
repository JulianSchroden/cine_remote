import '../../../interface/models/control_prop_type.dart';
import '../../../interface/models/control_prop_value.dart';
import 'ptp_event.dart';

class AllowedValuesChanged extends PtpEvent {
  final int propCode;
  final ControlPropType? propType;
  final List<ControlPropValue> allowedValues;

  const AllowedValuesChanged(this.propCode, this.propType, this.allowedValues);

  @override
  List<Object?> get props => [propType, allowedValues];
}
