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
    final packetReader = PtpPacketReader(PtpPacket(eventData));

    while (packetReader.unconsumedBytes > 8) {
      final oldOffset = packetReader.offset;
      final eventLength = packetReader.getUint32();
      final eventCode = packetReader.getUint32();

      switch (eventCode) {
        case PtpEventCode.propertyChanged:
          {
            try {
              final propertyCode = packetReader.getUint32();
              final propType = PtpPropertyType.values
                  .firstWhere((propTyp) => propTyp.native == propertyCode);
              final propertyValue = packetReader.getUint32();
              final mappedValue = mapValue(propType.mapped, propertyValue);
              logger.info(
                  'property ${propType.mapped} changed to ${mappedValue.mapped}');
            } catch (e) {
              //logger.info('Failed to map propertyCode');
              //logger.info(e);
            }

            break;
          }
      }

      final remainingBytes = (oldOffset + eventLength) - packetReader.offset;
      packetReader.skipBytes(remainingBytes);
    }

    return [];
  }
}
