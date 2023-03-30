import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_event_mapper.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/events/allowed_values_changed.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/events/prop_value_changed.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/events/ptp_event.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/constants/ptp_property.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/models/eos_ptp_prop_value.dart';
import 'package:cine_remote/camera_control/interface/models/camera_update_event.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PtpEventMapper sut;

  setUp(() {
    sut = const PtpEventMapper();
  });

  test('returns empty list when source events is empty list', () {
    final ptpEvents = <PtpEvent>[];

    final result = sut.mapToCommon(ptpEvents);

    expect(result, isEmpty);
  });

  test('maps propValueChanged event', () {
    final ptpEvents = [
      const PropValueChanged(
        ControlPropType.aperture,
        PtpPropertyCode.aperture,
        EosPtpPropValue('16', 0x48),
      ),
      const PropValueChanged(
        ControlPropType.iso,
        PtpPropertyCode.iso,
        EosPtpPropValue('Auto', 0x00),
      ),
      const AllowedValuesChanged(ControlPropType.shutterSpeed, [])
    ];

    final result = sut.mapToCommon(ptpEvents);

    expect(result.length, 2);
    expect(
      result,
      containsAll(
        [
          const CameraUpdateEvent.prop(
              ControlPropType.aperture, EosPtpPropValue('16', 0x48)),
          const CameraUpdateEvent.prop(
              ControlPropType.iso, EosPtpPropValue('Auto', 0x00)),
        ],
      ),
    );
  });
}
