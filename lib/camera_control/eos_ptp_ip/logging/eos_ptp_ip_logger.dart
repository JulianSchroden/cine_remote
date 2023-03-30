import 'dart:typed_data';

import '../../common/logging/base_camera_control_logger.dart';
import '../extensions/dump_bytes_extensions.dart';
import '../extensions/int_as_hex_string_extension.dart';
import 'eos_ptp_ip_logger_topics.dart';

class EosPtpIpLogger extends BaseCameraControlLogger {
  void logRawEvent(int eventCode, Uint8List data) {
    final topic = getTopic<RawEventLoggerTopic>();
    if (topic != null) {
      log(
        topic.level,
        'event ${eventCode.asHex()} occured with data:${data.dumpAsHex(
          asValidList: topic.dumpDataAsValidList,
          withLineNumbers: topic.dumpDataWithLineNumbers,
        )}',
      );
    }
  }

  void logPropertyChangedEvent(int propertyCode, Uint8List data) {
    final topic = getTopic<PropertyChangedLoggerTopic>();
    if (topic != null) {
      if (topic.propsBlackList.contains(propertyCode)) {
        return;
      }

      if (topic.propsWhitelist.isNotEmpty &&
          !topic.propsWhitelist.contains(propertyCode)) {
        return;
      }

      log(
        topic.level,
        'propertyChanged: ${propertyCode.asHex()} changed to:${data.dumpAsHex()}',
      );
    }
  }
}
