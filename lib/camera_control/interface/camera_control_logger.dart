import 'package:logger/logger.dart';

class LoggerTopic {
  final LogLevel level;

  const LoggerTopic({required this.level});
}

enum LogLevel {
  info,
  warning,
}

extension LogLevelToImplLevelExtension on LogLevel {
  Level toImpl() {
    switch (this) {
      case LogLevel.info:
        return Level.info;
      case LogLevel.warning:
        return Level.warning;
    }
  }
}

class CameraControlLogger {
  static CameraControlLogger instance = CameraControlLogger();

  final Logger _logger = Logger();
  List<LoggerTopic> _enabledTopics = [];

  set enabledTopics(List<LoggerTopic> topics) {
    instance._enabledTopics = topics;
  }

  List<LoggerTopic> get enabledTopics => instance._enabledTopics;

  Logger get logger => instance._logger;

  void log(
    LogLevel level,
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.log(level.toImpl(), message, error, stackTrace);
  }

  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.i(message, error, stackTrace);
  }

  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.w(message, error, stackTrace);
  }

  T? getTopic<T>() {
    try {
      final topic = enabledTopics.firstWhere((topic) => topic is T);
      return topic as T;
    } catch (e) {
      return null;
    }
  }

  bool isTopicEnabled<T>() {
    try {
      enabledTopics.firstWhere((topic) => topic is T);
      return true;
    } catch (e) {
      return false;
    }
  }
}
