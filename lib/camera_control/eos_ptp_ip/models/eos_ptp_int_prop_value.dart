import '../../interface/models/control_prop_value.dart';

class EosPtpIntPropValue extends ControlPropValue {
  final String commonValue;
  final int nativeValue;

  const EosPtpIntPropValue(this.commonValue, this.nativeValue);

  @override
  String get value => commonValue;

  @override
  List<Object?> get props => [commonValue, nativeValue];
}
