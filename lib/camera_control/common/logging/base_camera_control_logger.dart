import 'structured_log_printer.dart';
import 'package:logger/logger.dart';

import '../../interface/logging/camera_control_logger.dart';

class BaseCameraControlLogger extends CameraControlLogger {
  final Logger logger;

  BaseCameraControlLogger() : logger = Logger(printer: StructuredLogPrinter());

  @override
  void log(
    LogLevel level,
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.log(level.toImpl(), message, error, stackTrace);
  }

  @override
  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.i(message, error, stackTrace);
  }

  @override
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.w(message, error, stackTrace);
  }

  @override
  T? getTopic<T>() {
    try {
      final topic = _config?.enabledTopics.firstWhere((topic) => topic is T);

      return topic == null ? null : topic as T;
    } catch (e) {
      return null;
    }
  }

  @override
  bool isTopicEnabled<T>() {
    try {
      final topic = _config?.enabledTopics.firstWhere((topic) => topic is T);
      return topic != null;
    } catch (e) {
      return false;
    }
  }

  @override
  void whenTopicEnabled<T>(void Function(T topic) callback) {
    final topic = getTopic<T>();
    if (topic != null) {
      callback(topic);
    }
  }

  CameraControlLoggerConfig? get _config => CameraControlLoggerConfig.instance;
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
