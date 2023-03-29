import 'dart:typed_data';

import '../extensions/dump_bytes_extensions.dart';
import '../extensions/int_as_hex_string_extension.dart';

import '../../interface/camera_control_logger.dart';
import 'eos_ptp_ip_logger_topics.dart';

class EosPtpIpLogger extends CameraControlLogger {
  void logRawEvent(int eventCode, Uint8List data) {
    final topic = getTopic<RawEventLoggerTopic>();
    if (topic != null) {
      log(
        topic.level,
        'event ${eventCode.asHex()} occured with data:${data.dumpAsHex()}',
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
        'propertyChanged: prop ${propertyCode.asHex()} changed to:${data.dumpAsHex()}',
      );
    }
  }
}
