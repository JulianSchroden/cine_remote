import 'dart:typed_data';

import '../../common/logging/base_camera_control_logger.dart';
import '../extensions/dump_bytes_extensions.dart';
import 'topics/eos_event_topics.dart';
import 'topics/eos_ptp_ip_discovery_topic.dart';
import 'topics/transaction_queue_topics.dart';

class EosPtpIpLogger extends BaseCameraControlLogger
    with EosTransactionQueueLogger, EosEventLogger, EosPtpIpDiscoveryLogger {
  get math => null;

  void dumpPacket(Uint8List bytes) {
    print(
        'packet with length ${bytes.length} and data: \n ${bytes.dumpAsHex()}');
  }
}
