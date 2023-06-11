import 'dart:typed_data';

import '../constants/live_view_data_code.dart';
import '../constants/properties/touch_autofocus_status.dart';
import '../logging/eos_ptp_ip_logger.dart';
import '../models/eos_autofocus_state.dart';
import '../models/eos_live_view_response.dart';
import '../models/eos_sensor_info.dart';
import 'ptp_packet_reader.dart';

class EosLiveViewDataParser {
  final EosPtpIpLogger logger = EosPtpIpLogger();

  EosLiveViewDataParser();

  EosLiveViewResponse parseData(Uint8List liveViewData) {
    final packetReader = PtpPacketReader.fromBytes(liveViewData);
    Uint8List? imageBytes;
    EosTouchAutofocusState? touchAutofocusState;
    EosSensorInfo? sensorInfo;

    while (packetReader.unconsumedBytes > 8) {
      final segmentReader = packetReader.readSegment();
      final liveViewDataCode = segmentReader.getUint32();

      switch (liveViewDataCode) {
        case LiveViewDataCode.image:
          {
            imageBytes = segmentReader.getRemainingBytes();
            break;
          }

        case LiveViewDataCode.sensorResolution:
          {
            final width = segmentReader.getUint32();
            final height = segmentReader.getUint32();

            sensorInfo = EosSensorInfo(width: width, height: height);
          }

        case LiveViewDataCode.touchAutofocus:
          {
            segmentReader.getUint32(); // unknown value
            final status = segmentReader.getUint32();
            segmentReader.getUint32(); // unknown value

            final x = segmentReader.getUint32();
            final y = segmentReader.getUint32();

            final width = segmentReader.getUint32();
            final height = segmentReader.getUint32();

            final mappedStatus = mapTouchAutofocusStatus(status);
            if (mappedStatus == null) {
              logger.warning(
                  'LiveViewDataCode.touchAutofocus: Received unknown status $status');
              continue;
            }

            touchAutofocusState = EosTouchAutofocusState(
              mappedStatus,
              x,
              y,
              width,
              height,
            );

            break;
          }
      }
    }

    return EosLiveViewResponse(
      imageBytes,
      touchAutofocusState,
      sensorInfo,
    );
  }
}
