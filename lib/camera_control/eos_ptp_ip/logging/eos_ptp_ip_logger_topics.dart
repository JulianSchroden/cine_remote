import '../../interface/logging/camera_control_logger.dart';

class RawEventLoggerTopic extends LoggerTopic {
  final bool dumpDataAsValidList;
  final bool dumpDataWithLineNumbers;

  const RawEventLoggerTopic({
    required super.level,
    required this.dumpDataAsValidList,
    required this.dumpDataWithLineNumbers,
  });
}

class PropertyChangedLoggerTopic extends LoggerTopic {
  final List<int> propsWhitelist;
  final List<int> propsBlackList;

  PropertyChangedLoggerTopic({
    required super.level,
    required this.propsWhitelist,
    required this.propsBlackList,
  });
}

class EosPtpIpLoggerTopics {
  static RawEventLoggerTopic rawEvents({
    LogLevel level = LogLevel.info,
    bool dumpDataAsValidList = false,
    bool dumpDataWithLineNumbers = false,
  }) =>
      RawEventLoggerTopic(
        level: level,
        dumpDataAsValidList: dumpDataAsValidList,
        dumpDataWithLineNumbers: dumpDataWithLineNumbers,
      );

  static PropertyChangedLoggerTopic propertyChangedEvents({
    LogLevel level = LogLevel.info,
    List<int> propsWhitelist = const [],
    List<int> propsBlackList = const [],
  }) =>
      PropertyChangedLoggerTopic(
        level: level,
        propsWhitelist: propsWhitelist,
        propsBlackList: propsBlackList,
      );
}
