import '../../interface/camera_control_logger.dart';

class RawEventLoggerTopic extends LoggerTopic {
  const RawEventLoggerTopic({required super.level});
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
  static RawEventLoggerTopic rawEvents({LogLevel level = LogLevel.info}) =>
      RawEventLoggerTopic(level: level);

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
