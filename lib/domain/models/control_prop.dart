import 'package:freezed_annotation/freezed_annotation.dart';

import 'control_prop_type.dart';

part 'control_prop.freezed.dart';

@freezed
class ControlProp with _$ControlProp {
  const factory ControlProp({
    required ControlPropType type,
    required String currentValue,
    required List<String> allowedValues,
    @Default(false) bool isPending,
  }) = _ControlProp;
}
