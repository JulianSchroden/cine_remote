import '../../interface/models/control_prop.dart';
import '../../interface/models/control_prop_type.dart';
import '../communication/events/allowed_values_changed.dart';
import '../communication/events/prop_value_changed.dart';
import '../communication/events/ptp_event.dart';
import 'cached_property.dart';

class PtpPropertyCache {
  final Map<ControlPropType, CachedProperty> _cachedProps = {};

  void update(List<PtpEvent> events) {
    for (final event in events) {
      if (event is PropValueChanged) {
        if (event.propType == null) {
          continue;
        }

        if (_cachedProps.containsKey(event.propType)) {
          _cachedProps[event.propType!] =
              _cachedProps[event.propType]!.copyWith(
            currentValue: event.propValue,
          );
        } else {
          _cachedProps[event.propType!] = CachedProperty(
            type: event.propType!,
            currentValue: event.propValue,
          );
        }
      } else if (event is AllowedValuesChanged) {
        if (_cachedProps.containsKey(event.propType)) {
          _cachedProps[event.propType] = _cachedProps[event.propType]!.copyWith(
            allowedValues: event.allowedValues,
          );
        } else {
          _cachedProps[event.propType] = CachedProperty(
            type: event.propType,
            allowedValues: event.allowedValues,
          );
        }
      }
    }
  }

  List<ControlPropType> supportedProps() {
    return _validEntries.map((entry) => entry.key).toList();
  }

  ControlProp? getProp(ControlPropType propType) {
    final cachedProp = _cachedProps[propType];
    if (cachedProp == null || !cachedProp.isValid) return null;

    return ControlProp(
      type: cachedProp.type,
      currentValue: cachedProp.currentValue!,
      allowedValues: cachedProp.allowedValues!,
    );
  }

  List<ControlProp> listAll() {
    return _validEntries
        .map(
          (entry) => ControlProp(
            type: entry.key,
            currentValue: entry.value.currentValue!,
            allowedValues: entry.value.allowedValues!,
          ),
        )
        .toList();
  }

  Iterable<MapEntry<ControlPropType, CachedProperty>> get _validEntries =>
      _cachedProps.entries.where((entry) => entry.value.isValid);
}
