import '../../../common/logging/base_camera_control_logger.dart';
import '../../../interface/logging/camera_control_logger.dart';
import '../../extensions/dump_bytes_extensions.dart';
import '../../extensions/int_as_hex_string_extension.dart';
import '../../models/ptp_packet.dart';
import '../../responses/ptp_response.dart';

class EosPtpTransactionQueueTopic extends LoggerTopic {
  const EosPtpTransactionQueueTopic({super.level = LogLevel.info});
}

mixin EosTransactionQueueLogger on BaseCameraControlLogger {
  void logTransactionQueueInfo(dynamic message) {
    whenTopicEnabled<EosPtpTransactionQueueTopic>((topic) {
      info(message);
    });
  }

  void logNextRequest(int operationCode, PtpPacket packet) {
    whenTopicEnabled<EosPtpTransactionQueueTopic>((topic) {
      info(
        'Sending request ${operationCode.asHex(padLeft: 4)} with data: ${packet.data.dumpAsHex()}',
      );
    });
  }

  void logDataStart(PtpPacket packet) {
    whenTopicEnabled<EosPtpTransactionQueueTopic>((topic) {
      info('Sending dataStart packet with payload: ${packet.data.dumpAsHex()}');
    });
  }

  void logDataEnd(PtpPacket packet) {
    whenTopicEnabled<EosPtpTransactionQueueTopic>((topic) {
      info('Sending dataEnd packet with paylaod: ${packet.data.dumpAsHex()}');
    });
  }

  void logCompleteTransaction(PtpResponse response) {
    whenTopicEnabled<EosPtpTransactionQueueTopic>((topic) {
      info('Completing transaction with response: $response');
    });
  }
}
