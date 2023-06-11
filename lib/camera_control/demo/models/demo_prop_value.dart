import '../../interface/models/control_prop_value.dart';

class DemoPropValue extends ControlPropValue {
  final String demoValue;

  const DemoPropValue(this.demoValue);

  @override
  String get value => demoValue;

  @override
  List<Object?> get props => [demoValue];
}
