import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_event_mapper.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/events/allowed_values_changed.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/events/prop_value_changed.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/events/ptp_event.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/constants/ptp_property.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/models/eos_ptp_prop_value.dart';
import 'package:cine_remote/camera_control/interface/models/camera_update_event.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop_type.dart';
import 'package:flutter_test/flutter_test.dart';

class FakePtpEvent extends Fake implements PtpEvent {}

void main() {
  late PtpEventMapper sut;

  setUp(() {
    sut = const PtpEventMapper();
  });

  test('returns null when source events has unknown type', () {
    final result = sut.mapToCommon(FakePtpEvent());

    expect(result, isNull);
  });

  group('on propValueChanged event', () {
    test('returns null when event has unknown propType', () {
      const unknownPropChanged = PropValueChanged(
        null,
        0xF0F0,
        EosPtpPropValue('99', 0xFF),
      );

      final result = sut.mapToCommon(unknownPropChanged);
      expect(result, isNull);
    });

    test('maps aperture changed event', () {
      const apertureChanged = PropValueChanged(
        ControlPropType.aperture,
        PtpPropertyCode.aperture,
        EosPtpPropValue('16', 0x48),
      );

      final result = sut.mapToCommon(apertureChanged);

      expect(
        result,
        const CameraUpdateEvent.propValueChanged(
          ControlPropType.aperture,
          EosPtpPropValue('16', 0x48),
        ),
      );
    });

    test('maps iso changed event', () {
      const isoChanged = PropValueChanged(
        ControlPropType.iso,
        PtpPropertyCode.iso,
        EosPtpPropValue('Auto', 0x00),
      );

      final result = sut.mapToCommon(isoChanged);

      expect(
        result,
        const CameraUpdateEvent.propValueChanged(
          ControlPropType.iso,
          EosPtpPropValue('Auto', 0x00),
        ),
      );
    });
  });

  group('on allowedValuesChanged event', () {
    test('maps allowedValuesChanged event', () {
      const allowedIsoValuesChanged = AllowedValuesChanged(
        ControlPropType.iso,
        [
          EosPtpPropValue('100', 0x48),
          EosPtpPropValue('200', 0x50),
          EosPtpPropValue('400', 0x58),
        ],
      );

      final result = sut.mapToCommon(allowedIsoValuesChanged);

      expect(
        result,
        const CameraUpdateEvent.propAllowedValuesChanged(
          ControlPropType.iso,
          [
            EosPtpPropValue('100', 0x48),
            EosPtpPropValue('200', 0x50),
            EosPtpPropValue('400', 0x58),
          ],
        ),
      );
    });
  });
}
