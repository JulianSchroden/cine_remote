import '../../../common/logging/base_camera_control_logger.dart';
import '../../../interface/logging/camera_control_logger.dart';
import '../../extensions/dump_bytes_extensions.dart';
import '../../extensions/int_as_hex_string_extension.dart';
import '../../models/ptp_packet.dart';
import '../../responses/ptp_response.dart';

class TransactionQueueChannel extends LoggerChannel {
  const TransactionQueueChannel();
}

class EosPtpTransactionQueueTopic extends LoggerTopic<TransactionQueueChannel> {
  const EosPtpTransactionQueueTopic({super.level = LogLevel.info});
}

mixin EosTransactionQueueLogger on BaseCameraControlLogger {
  void logNextRequest(int operationCode, PtpPacket packet) {
    whenTopicEnabled<EosPtpTransactionQueueTopic>((topic) {
      log<TransactionQueueChannel>(
        topic.level,
        'Sending request ${operationCode.asHex(padLeft: 4)} with data: ${packet.data.dumpAsHex()}',
      );
    });
  }

  void logDataStart(PtpPacket packet) {
    whenTopicEnabled<EosPtpTransactionQueueTopic>((topic) {
      log<TransactionQueueChannel>(topic.level,
          'Sending dataStart packet with payload: ${packet.data.dumpAsHex()}');
    });
  }

  void logDataEnd(PtpPacket packet) {
    whenTopicEnabled<EosPtpTransactionQueueTopic>((topic) {
      log<TransactionQueueChannel>(topic.level,
          'Sending dataEnd packet with paylaod: ${packet.data.dumpAsHex()}');
    });
  }

  void logCompleteTransaction(PtpResponse response) {
    whenTopicEnabled<EosPtpTransactionQueueTopic>((topic) {
      log<TransactionQueueChannel>(
          topic.level, 'Completing transaction with response: $response');
    });
  }
}
