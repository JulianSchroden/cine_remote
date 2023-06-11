import 'package:freezed_annotation/freezed_annotation.dart';

import '../../interface/models/control_prop_type.dart';
import '../../interface/models/control_prop_value.dart';

part 'cached_property.freezed.dart';

@freezed
class CachedProperty with _$CachedProperty {
  const CachedProperty._();

  const factory CachedProperty({
    required int propCode,
    ControlPropType? type,
    ControlPropValue? currentValue,
    List<ControlPropValue>? allowedValues,
  }) = _CachedProperty;

  bool get isValid =>
      type != null && currentValue != null && allowedValues != null;
  bool get isInvalid => !isValid;
}
