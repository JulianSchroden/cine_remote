import 'package:freezed_annotation/freezed_annotation.dart';

import 'control_prop_type.dart';

part 'control_prop.freezed.dart';

@freezed
class ControlProp with _$ControlProp {
  const ControlProp._();

  const factory ControlProp({
    required ControlPropType type,
    required String currentValue,
    required List<String> allowedValues,
    DateTime? pendingSince,
  }) = _ControlProp;

  bool get isPending => pendingSince != null;
}
