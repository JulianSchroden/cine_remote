import '../../interface/models/control_prop_value.dart';

class EosCinePropValue extends ControlPropValue {
  final String nativeValue;

  const EosCinePropValue(this.nativeValue);

  @override
  String get value => nativeValue;

  @override
  List<Object?> get props => [nativeValue];
}
