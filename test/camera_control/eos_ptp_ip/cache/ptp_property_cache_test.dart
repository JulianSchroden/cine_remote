import 'package:cine_remote/camera_control/eos_ptp_ip/cache/ptp_property_cache.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/events/allowed_values_changed.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/events/prop_value_changed.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/constants/ptp_property.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/models/eos_ptp_int_prop_value.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop_type.dart';
import 'package:flutter_test/flutter_test.dart';

part 'ptp_property_cache_test.data.dart';

void main() {
  late PtpPropertyCache sut;

  setUp(() {
    sut = PtpPropertyCache();
  });

  group('supportedProps', () {
    test('supportedProps returns empty list when cache empty', () {
      final result = sut.supportedProps();

      expect(result, isEmpty);
    });

    test('supportedProps returns types of cached properties', () {
      final events = [
        apertureValueChangedEvent,
        apertureAllowedValuesChangedEvent,
        isoValueChangedEvent,
        isoAllowedValuesChangedEvent,
      ];

      sut.update(events);

      final result = sut.supportedProps();

      expect(result.length, 2);
      expect(
        result,
        containsAll(
          [
            ControlPropType.aperture,
            ControlPropType.iso,
          ],
        ),
      );
    });

    test('supportedProps filters out keys of entries with missing fields', () {
      final events = [
        apertureValueChangedEvent,
        isoValueChangedEvent,
        isoAllowedValuesChangedEvent,
      ];

      sut.update(events);

      final result = sut.supportedProps();

      expect(result.length, 1);
      expect(
        result,
        containsAll(
          [
            ControlPropType.iso,
          ],
        ),
      );
    });
  });

  group('getProp', () {
    test('getProp returns null when cache empty', () {
      final result = sut.getProp(ControlPropType.iso);

      expect(result, isNull);
    });

    test('getProp returns null when cache entry has missing fields', () {
      sut.update([
        apertureValueChangedEvent,
      ]);

      final result = sut.getProp(ControlPropType.aperture);

      expect(result, isNull);
    });

    test('getProp returns null when key not present in cache', () {
      sut.update([
        isoValueChangedEvent,
        isoAllowedValuesChangedEvent,
      ]);

      final result = sut.getProp(ControlPropType.aperture);

      expect(result, isNull);
    });

    test('getProp returns cached ControlProp when all fields are set', () {
      sut.update([
        apertureValueChangedEvent,
        apertureAllowedValuesChangedEvent,
        isoValueChangedEvent,
        isoAllowedValuesChangedEvent,
      ]);

      final result = sut.getProp(ControlPropType.iso);

      expect(result, isNotNull);
      expect(
        result,
        const ControlProp(
          type: ControlPropType.iso,
          currentValue: EosPtpIntPropValue(
            '100',
            0x48,
          ),
          allowedValues: isoAllowedValues,
        ),
      );
    });
  });

  group('listAll', () {
    test('listAll returns empty list when cache empty', () {
      final result = sut.listAll();

      expect(result, isEmpty);
    });

    test('listAll returns cached properties', () {
      final events = [
        apertureValueChangedEvent,
        apertureAllowedValuesChangedEvent,
        isoValueChangedEvent,
        isoAllowedValuesChangedEvent,
      ];

      sut.update(events);

      final result = sut.listAll();

      expect(result.length, 2);
      expect(
        result,
        containsAll(
          [
            const ControlProp(
              type: ControlPropType.aperture,
              currentValue: EosPtpIntPropValue('10', 0x3d),
              allowedValues: apertureAllowedValues,
            ),
            const ControlProp(
              type: ControlPropType.iso,
              currentValue: EosPtpIntPropValue('100', 0x48),
              allowedValues: isoAllowedValues,
            )
          ],
        ),
      );
    });

    test('listAll filters out entries with missing fields', () {
      final events = [
        apertureValueChangedEvent,
        isoValueChangedEvent,
        isoAllowedValuesChangedEvent,
      ];

      sut.update(events);

      final result = sut.listAll();

      expect(result.length, 1);
      expect(
        result,
        containsAll(
          [
            const ControlProp(
              type: ControlPropType.iso,
              currentValue: EosPtpIntPropValue('100', 0x48),
              allowedValues: isoAllowedValues,
            )
          ],
        ),
      );
    });
  });
}
