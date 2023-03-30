import 'dart:typed_data';

import '../../../common/logging/base_camera_control_logger.dart';
import '../../../interface/logging/camera_control_logger.dart';
import '../../extensions/dump_bytes_extensions.dart';
import '../../extensions/int_as_hex_string_extension.dart';

class RawEventChannel extends LoggerChannel {
  const RawEventChannel();
}

class EosPtpRawEventLoggerTopic extends LoggerTopic<RawEventChannel> {
  final bool dumpDataAsValidList;
  final bool dumpDataWithLineNumbers;

  const EosPtpRawEventLoggerTopic({
    super.level = LogLevel.info,
    this.dumpDataAsValidList = false,
    this.dumpDataWithLineNumbers = false,
  });
}

class PropertyChangedChannel extends LoggerChannel {
  const PropertyChangedChannel();
}

class EosPtpPropertyChangedLoggerTopic
    extends LoggerTopic<PropertyChangedChannel> {
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
    final config = getTopic<EosPtpRawEventLoggerTopic>();
    if (config != null) {
      log<RawEventChannel>(
        config.level,
        'event ${eventCode.asHex()} occured with data:${data.dumpAsHex(
          asValidList: config.dumpDataAsValidList,
          withLineNumbers: config.dumpDataWithLineNumbers,
        )}',
      );
    }
  }

  void logPropertyChangedEvent(int propertyCode, Uint8List data) {
    final config = getTopic<EosPtpPropertyChangedLoggerTopic>();
    if (config != null) {
      if (config.propsBlackList.contains(propertyCode)) {
        return;
      }

      if (config.propsWhitelist.isNotEmpty &&
          !config.propsWhitelist.contains(propertyCode)) {
        return;
      }

      log<PropertyChangedChannel>(
        config.level,
        'propertyChanged: ${propertyCode.asHex()} changed to:${data.dumpAsHex()}',
      );
    }
  }
}
