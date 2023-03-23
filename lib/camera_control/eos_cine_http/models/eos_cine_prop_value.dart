import '../../interface/models/control_prop_value.dart';

class EosCinePropValue extends ControlPropValue {
  const EosCinePropValue(super.value);

  String get nativeValue => value;

  @override
  List<Object?> get props => [...super.props];
}
