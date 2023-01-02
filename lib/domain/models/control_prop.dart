import 'package:cine_remote/domain/models/control_prop_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'control_prop.freezed.dart';

@freezed
class ControlProp with _$ControlProp {
  const factory ControlProp({
    required ControlPropType type,
    @Default('') String currentValue,
    @Default([]) List<String> allowedValues,
  }) = _ControlProp;
}
