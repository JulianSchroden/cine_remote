import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../interface/models/camera_update_event.dart';
import '../constants/ptp_event_code.dart';
import '../constants/ptp_property.dart';
import 'ptp_packet_reader.dart';

class PtpEventDataParser {
  List<Uint8List> groupData(Uint8List eventData) {
    final byteData = ByteData.view(eventData.buffer);

    final groupedEvents = <Uint8List>[];
    var offset = 0;
    while (offset < byteData.lengthInBytes) {
      if (byteData.lengthInBytes - offset < 8) {
        break;
      }

      final eventLength = byteData.getUint32(offset, Endian.little);
      final eventBytes = eventData.sublist(offset, offset + eventLength);
      groupedEvents.add(eventBytes);
      offset += eventLength;
    }
    return groupedEvents;
  }

  List<CameraUpdateEvent> parseEvents(Uint8List eventData) {
    final logger = Logger('parseEvents');
    final packetReader = PtpPacketReader.fromBytes(eventData);
    final updateEvents = <CameraUpdateEvent>[];

    while (packetReader.unconsumedBytes > 8) {
      packetReader.processSegment((reader) {
        final eventCode = packetReader.getUint32();

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
              final propertyCode = packetReader.getUint32();
              final propType = mapPropCodeToType(propertyCode);
              if (propType == null) break;

              packetReader.getUint32(); // unknown value

              final totalAllowedValues = packetReader.getUint32();
              final List allowedValues = [];
              for (int i = 0; i < totalAllowedValues; i++) {
                final value = packetReader.getUint32();
                final propValue = mapPtpValue(propType, value);
                allowedValues.add(propValue);
              }

              logger.info(allowedValues);
              break;
            }
        }
      });
    }

    return updateEvents;
  }

  CameraUpdateEvent? parsePropertyChangedEvent(PtpPacketReader packetReader) {
    final propertyCode = packetReader.getUint32();

    final propType = mapPropCodeToType(propertyCode);
    if (propType == null) return null;

    final propertyValue = packetReader.getUint32();
    final mappedValue = mapPtpValue(propType, propertyValue);

    return CameraUpdateEvent.prop(propType, mappedValue);
  }
}
