import 'package:freezed_annotation/freezed_annotation.dart';

import 'control_prop_type.dart';
import 'control_prop_value.dart';

part 'control_prop.freezed.dart';

@freezed
class ControlProp with _$ControlProp {
  const ControlProp._();

  const factory ControlProp({
    required ControlPropType type,
    required ControlPropValue currentValue,
    required List<ControlPropValue> allowedValues,
    DateTime? pendingSince,
  }) = _ControlProp;

  bool get isPending => pendingSince != null;
}
