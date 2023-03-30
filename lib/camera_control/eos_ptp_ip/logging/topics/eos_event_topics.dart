import 'dart:typed_data';

import '../../../common/logging/base_camera_control_logger.dart';
import '../../../interface/logging/camera_control_logger.dart';
import '../../extensions/dump_bytes_extensions.dart';
import '../../extensions/int_as_hex_string_extension.dart';

class EosPtpRawEventLoggerTopic extends LoggerTopic {
  final bool dumpDataAsValidList;
  final bool dumpDataWithLineNumbers;

  const EosPtpRawEventLoggerTopic({
    super.level = LogLevel.info,
    this.dumpDataAsValidList = false,
    this.dumpDataWithLineNumbers = false,
  });
}

class EosPtpPropertyChangedLoggerTopic extends LoggerTopic {
  final List<int> propsWhitelist;
  final List<int> propsBlackList;

  const EosPtpPropertyChangedLoggerTopic({
    super.level = LogLevel.info,
    this.propsWhitelist = const [],
    this.propsBlackList = const [],
  });
}

mixin EosEventLogger on BaseCameraControlLogger {
  void logRawEvent(int eventCode, Uint8List data) {
    final topic = getTopic<EosPtpRawEventLoggerTopic>();
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
    final topic = getTopic<EosPtpPropertyChangedLoggerTopic>();
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
