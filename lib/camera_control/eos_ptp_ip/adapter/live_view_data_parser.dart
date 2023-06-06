import 'package:flutter/foundation.dart';

import '../../interface/logging/camera_control_logger.dart';
import '../extensions/dump_bytes_extensions.dart';
import '../logging/eos_ptp_ip_logger.dart';
import 'ptp_packet_reader.dart';

class LiveViewDataCode {
  const LiveViewDataCode._();

  static const image = 0x1;
}

class LiveViewDataParser {
  Map<int, Uint8List> segmentCache = {};
  final EosPtpIpLogger logger = EosPtpIpLogger();

  Uint8List? extractImage(Uint8List liveViewData) {
    final packetReader = PtpPacketReader.fromBytes(liveViewData);
    Uint8List? imageBytes;

    while (packetReader.unconsumedBytes > 8) {
      final segmentReader = packetReader.readSegment();

      final liveViewDataCode = segmentReader.getUint32();

      switch (liveViewDataCode) {
        case LiveViewDataCode.image:
          imageBytes = segmentReader.getRemainingBytes();
          break;
        case 0x5:
          {
            break;
            //final a = segmentReader.getUint32();
            //final b = segmentReader.getUint32();
            //
            //logger.info('0x5 data: $a, $b');
          }

        case 0x8:
          {
            /*
              flutter:   LiveView property 8 changed to
               [
                  01 00 00 00 30 00 00 00  01 00 00 00 70 0a 00 00
                  c0 04 00 00 ae 01 00 00  ae 01 00 00
               ]
            */

            // data is emitted while tracking
            // when tracking ends, this entry is missing.
            final a = segmentReader.getUint32();
            final state = segmentReader
                .getUint32(); // 48 = tracking, 49: Focus found, 50: Focus not found
            final b = segmentReader.getUint32();
            final x = segmentReader.getUint32();
            final y = segmentReader.getUint32();
            final width = segmentReader.getUint32();
            final height = segmentReader.getUint32();

            final centerPosX = x + width / 2;
            final centerPosY = y + height / 2;

            logger.info(
                '0x8 data: state: $state, pos: $x, $y, center: $centerPosX: $centerPosY (a: $a, b: $b, c: $width, d: $height)');
            break;
          }

        case 0xd:
          {
            break;
            //    final a = segmentReader.getUint32();
            //    final b = segmentReader.getUint32();
            //    final c = segmentReader.getUint32();
            //    final d = segmentReader.getUint32();
            //
            //    logger.info('$a, $b, $c, $d');
          }
        default:
          {
            final ignoredCodes = [
              0x11,
              0xA,
              0xFFFFFFFF,
            ];

            if (ignoredCodes.contains(liveViewDataCode)) break;

            //final whitelistedCodes = [
            //  0xd,
            //  /* 0xd, 0x5, 0x8, 0xd*/
            //];
            //if (!whitelistedCodes.contains(liveViewDataCode)) break;

            final currentContent = segmentReader.getRemainingBytes();
            if (segmentCache.containsKey(liveViewDataCode)) {
              final oldContent = segmentCache[liveViewDataCode];
              // width: 5472, height: 3648
              if (!listEquals(oldContent, currentContent)) {
                logger.log(LogLevel.info,
                    'LiveView property $liveViewDataCode changed to ${currentContent.dumpAsHex()}');
              }
            }
            segmentCache[liveViewDataCode] = currentContent;
          }
      }
    }

    return imageBytes;
  }
}
