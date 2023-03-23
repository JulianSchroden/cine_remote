import '../../interface/models/control_prop_value.dart';

class EosPtpPropValue extends ControlPropValue {
  final int nativeValue;

  const EosPtpPropValue(super.value, this.nativeValue);

  @override
  List<Object?> get props => [...super.props, nativeValue];
}
