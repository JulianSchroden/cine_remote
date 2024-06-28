import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:logger/logger.dart' as logger_impl;

import 'structured_log_printer.dart';

class CameraControlLoggerImpl extends Logger {
  final logger_impl.Logger logger;

  CameraControlLoggerImpl()
      : logger = logger_impl.Logger(printer: StructuredLogPrinter());

  @override
  void log<C extends LoggerChannel>(
    LogLevel level,
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.log(level.toImpl(), message, error: error, stackTrace: stackTrace);
  }

  @override
  void info<C extends LoggerChannel>(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void warning<C extends LoggerChannel>(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }
}

extension LogLevelToImplLevelExtension on LogLevel {
  logger_impl.Level toImpl() {
    switch (this) {
      case LogLevel.info:
        return logger_impl.Level.info;
      case LogLevel.warning:
        return logger_impl.Level.warning;
    }
  }
}
