import 'dart:typed_data';

import '../../interface/models/control_prop_value.dart';
import '../communication/events/allowed_values_changed.dart';
import '../communication/events/prop_value_changed.dart';
import '../communication/events/ptp_event.dart';
import '../constants/ptp_event_code.dart';
import '../constants/ptp_property.dart';
import '../logging/eos_ptp_ip_logger.dart';
import 'ptp_packet_reader.dart';

class PtpEventDataParser {
  final EosPtpIpLogger logger = EosPtpIpLogger();

  List<PtpEvent> parseEvents(Uint8List eventData) {
    final packetReader = PtpPacketReader.fromBytes(eventData);
    final updateEvents = <PtpEvent>[];

    while (packetReader.unconsumedBytes > 8) {
      packetReader.processSegment((packetReader) {
        final eventCode = packetReader.getUint32();

        logger.logRawEvent(eventCode, packetReader.peekRemainingBytes());

        switch (eventCode) {
          case PtpEventCode.propertyChanged:
            {
              final propChangedEvent = parsePropertyChangedEvent(packetReader);
              if (propChangedEvent != null) {
                updateEvents.add(propChangedEvent);
              }
              break;
            }
          case PtpEventCode.allowedValuesChanged:
            {
              final allowedValuesChanged =
                  parseAllowedValuesChangedEvent(packetReader);
              if (allowedValuesChanged != null) {
                updateEvents.add(allowedValuesChanged);
              }
              break;
            }
        }
      });
    }

    return updateEvents;
  }

  PropValueChanged? parsePropertyChangedEvent(PtpPacketReader packetReader) {
    final propertyCode = packetReader.getUint32();
    logger.logPropertyChangedEvent(
        propertyCode, packetReader.peekRemainingBytes());

    final propertyValue = packetReader.getUint32();
    final mappedValue = mapPtpValue(propertyCode, propertyValue);
    final propType = mapPropCodeToType(propertyCode);

    return PropValueChanged(propType, propertyCode, mappedValue);
  }

  AllowedValuesChanged? parseAllowedValuesChangedEvent(
    PtpPacketReader packetReader,
  ) {
    final propertyCode = packetReader.getUint32();
    final propType = mapPropCodeToType(propertyCode);
    if (propType == null) return null;

    packetReader.getUint32(); // unknown value

    final totalAllowedValues = packetReader.getUint32();
    final allowedValues = <ControlPropValue>[];
    for (int i = 0; i < totalAllowedValues; i++) {
      final value = packetReader.getUint32();
      final propValue = mapPtpValue(propertyCode, value);
      allowedValues.add(propValue);
    }

    return AllowedValuesChanged(propType, allowedValues);
  }
}
