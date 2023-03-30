class LoggerChannel {
  const LoggerChannel();
}

class LoggerTopic<C extends LoggerChannel> {
  final LogLevel level;

  const LoggerTopic({required this.level});
}

class UnspecifiedChannel extends LoggerChannel {
  const UnspecifiedChannel();
}

class UnspecifiedLoggerTopic extends LoggerTopic<UnspecifiedChannel> {
  /// Fallback LoggerTopic.
  ///
  /// UnspecifiedLoggerTopic is used to ensure logging calls which do not specify
  /// a [LoggerChannel] are logged.
  const UnspecifiedLoggerTopic({super.level = LogLevel.info});
}

enum LogLevel {
  info,
  warning,
}

abstract class CameraControlLogger {
  const CameraControlLogger();

  void log<C extends LoggerChannel>(
    LogLevel level,
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]);

  void info<C extends LoggerChannel>(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]);

  void warning<C extends LoggerChannel>(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]);

  T? getTopic<T>();
  bool isTopicEnabled<T>();
  void whenTopicEnabled<T>(void Function(T topic) callback);

  bool isChannelEnabled<C extends LoggerChannel>();
}

/// The global config for the [CameraControlLogger].
///
/// This config is used to enable specific logging topics for debugging purposes.
class CameraControlLoggerConfig {
  static CameraControlLoggerConfig? _instance;
  static CameraControlLoggerConfig? get instance => _instance;

  List<LoggerTopic> _enabledTopics = [];

  /// Initializes the CameraControlLoggerConfig [instance] and sets the enabled topics.
  ///
  /// Use the [enabledTopics] list to configure the logging output.
  static void init({
    required List<LoggerTopic> enabledTopics,
    CameraControlLogger? logger,
  }) {
    _instance = CameraControlLoggerConfig();
    _instance!._enabledTopics = [
      ...enabledTopics,
      const UnspecifiedLoggerTopic(),
    ];
  }

  List<LoggerTopic> get enabledTopics => _enabledTopics;
}
