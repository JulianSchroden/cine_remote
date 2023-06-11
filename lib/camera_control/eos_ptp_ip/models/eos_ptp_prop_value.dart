import '../../interface/models/control_prop_value.dart';

class EosPtpPropValue extends ControlPropValue {
  final String commonValue;
  final int nativeValue;

  const EosPtpPropValue(this.commonValue, this.nativeValue);

  @override
  String get value => commonValue;

  @override
  List<Object?> get props => [commonValue, nativeValue];
}
