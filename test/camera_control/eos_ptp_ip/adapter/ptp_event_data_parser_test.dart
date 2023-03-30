import 'package:cine_remote/camera_control/eos_ptp_ip/adapter/ptp_event_data_parser.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/events/allowed_values_changed.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/communication/events/prop_value_changed.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/constants/properties/live_view_output.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/constants/ptp_property.dart';
import 'package:cine_remote/camera_control/eos_ptp_ip/models/eos_ptp_prop_value.dart';
import 'package:cine_remote/camera_control/interface/models/control_prop_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../packet_helper.dart';
part 'ptp_event_data_parser_test.data.dart';

void main() {
  late PtpEventDataParser sut;

  setUp(() {
    sut = PtpEventDataParser();
  });

  group('parseEvents', () {
    test('parses value changed events of mappable propType', () {
      final result = sut.parseEvents(propChangedEventData);

      expect(result.length, 2);
      expect(
        result,
        containsAll([
          const PropValueChanged(
            ControlPropType.shutterSpeed,
            PtpPropertyCode.shutterSpeed,
            EosPtpPropValue('1/20', 0x5b),
          ),
          const PropValueChanged(
            ControlPropType.aperture,
            PtpPropertyCode.aperture,
            EosPtpPropValue('2.0', 0x18),
          )
        ]),
      );
    });

    test('parses value changed events of unknown propTypes', () {
      final result = sut.parseEvents(liveViewOutputChangedEventData);

      expect(
        result,
        containsAll(
          [
            PropValueChanged(
              null,
              PtpPropertyCode.liveViewOutput,
              EosPtpPropValue(
                LiveViewOutput.cameraAndHost.name,
                LiveViewOutput.cameraAndHost.value,
              ),
            )
          ],
        ),
      );
    });

    test('parses allowed values changed events', () {
      final result = sut.parseEvents(allowedValuesChangedEventData);

      expect(result.length, 2);
      expect(
        result,
        containsAll(
          [
            const AllowedValuesChanged(ControlPropType.aperture, [
              EosPtpPropValue('1.8', 0x15),
              EosPtpPropValue('2.0', 0x18),
              EosPtpPropValue('2.2', 0x1b),
            ]),
            const AllowedValuesChanged(ControlPropType.shutterSpeed, [
              EosPtpPropValue('30', 0x10),
              EosPtpPropValue('25', 0x13),
              EosPtpPropValue('20', 0x15),
              EosPtpPropValue('15', 0x18),
            ])
          ],
        ),
      );
    });
  });
}
