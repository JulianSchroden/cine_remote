class LoggerTopic {
  final LogLevel level;

  const LoggerTopic({required this.level});
}

enum LogLevel {
  info,
  warning,
}

abstract class CameraControlLogger {
  const CameraControlLogger();

  void log(
    LogLevel level,
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]);

  void info(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]);

  T? getTopic<T>();
  bool isTopicEnabled<T>();
}

/// The global config for the CameraControlLogger.
///
/// This config is used to enable specific logging topics for debugging purposes.
class CameraControlLoggerConfig {
  static CameraControlLoggerConfig? _instance;
  static CameraControlLoggerConfig? get instance => _instance;

  List<LoggerTopic> _enabledTopics = [];

  static void init({
    required List<LoggerTopic> enabledTopics,
    CameraControlLogger? logger,
  }) {
    _instance = CameraControlLoggerConfig();
    _instance!._enabledTopics = enabledTopics;
  }

  List<LoggerTopic> get enabledTopics => _enabledTopics;
}
