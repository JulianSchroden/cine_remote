import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../interface/models/camera_update_event.dart';
import '../constants/ptp_event_code.dart';
import '../constants/ptp_property.dart';
import '../models/ptp_packet.dart';
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

    while (packetReader.unconsumedBytes > 8) {
      final oldOffset = packetReader.offset;
      final eventLength = packetReader.getUint32();
      final eventCode = packetReader.getUint32();

      switch (eventCode) {
        case PtpEventCode.propertyChanged:
          {
            final propertyCode = packetReader.getUint32();

            final propType = mapPropType(propertyCode);
            if (propType == null) break;

            final propertyValue = packetReader.getUint32();
            final propValue = mapPtpValue(propType, propertyValue);
            logger.info('property $propType changed to $propValue');
            break;
          }
        case PtpEventCode.allowedValuesChanged:
          {
            final propertyCode = packetReader.getUint32();
            final propType = mapPropType(propertyCode);
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

      final remainingBytes = (oldOffset + eventLength) - packetReader.offset;
      packetReader.skipBytes(remainingBytes);
    }

    return [];
  }
}
