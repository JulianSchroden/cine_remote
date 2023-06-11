import '../../../shared/extensions/list_extensions.dart';
import '../../common/extensions/list_extensions.dart';
import '../../interface/models/control_prop.dart';
import '../../interface/models/control_prop_type.dart';
import '../../interface/models/control_prop_value.dart';
import '../communication/events/allowed_values_changed.dart';
import '../communication/events/prop_value_changed.dart';
import '../communication/events/ptp_event.dart';
import 'cached_property.dart';

class PtpPropertyCache {
  final Map<int, CachedProperty> _cachedProps = {};

  void update(List<PtpEvent> events) {
    for (final event in events) {
      if (event is PropValueChanged) {
        if (_cachedProps.containsKey(event.propCode)) {
          _cachedProps[event.propCode] = _cachedProps[event.propCode]!.copyWith(
            currentValue: event.propValue,
          );
        } else {
          _cachedProps[event.propCode] = CachedProperty(
            propCode: event.propCode,
            type: event.propType,
            currentValue: event.propValue,
          );
        }
      } else if (event is AllowedValuesChanged) {
        if (_cachedProps.containsKey(event.propCode)) {
          _cachedProps[event.propCode] = _cachedProps[event.propCode]!.copyWith(
            allowedValues: event.allowedValues,
          );
        } else {
          _cachedProps[event.propCode] = CachedProperty(
            propCode: event.propCode,
            type: event.propType,
            allowedValues: event.allowedValues,
          );
        }
      }
    }
  }

  List<ControlPropType> supportedProps() {
    return _validEntries
        .map((entry) => entry.value.type)
        .whereNotNull()
        .toList();
  }

  ControlProp? getProp(ControlPropType propType) {
    final cachedProp =
        _cachedProps.values.firstWhereOrNull((prop) => prop.type == propType);

    if (cachedProp?.isInvalid ?? true) return null;

    return ControlProp(
      type: cachedProp!.type!,
      currentValue: cachedProp.currentValue!,
      allowedValues: cachedProp.allowedValues!,
    );
  }

  ControlPropValue? getValueByPropCode(int propCode) {
    return _cachedProps[propCode]?.currentValue;
  }

  List<ControlProp> listAll() {
    return _validEntries
        .map(
          (entry) => ControlProp(
            type: entry.value.type!,
            currentValue: entry.value.currentValue!,
            allowedValues: entry.value.allowedValues!,
          ),
        )
        .toList();
  }

  Iterable<MapEntry<int, CachedProperty>> get _validEntries =>
      _cachedProps.entries.where((entry) => entry.value.isValid);
}
