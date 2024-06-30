import 'package:logger/logger.dart' as logger_impl;

import 'structured_log_printer.dart';

enum LogLevel {
  debug,
  info,
  warning,
}

class Logger {
  final logger_impl.Logger logger;

  Logger() : logger = logger_impl.Logger(printer: StructuredLogPrinter());

  void log(
    LogLevel level,
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.log(level.toImpl(), message, error: error, stackTrace: stackTrace);
  }

  void debug(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.d(message, error: error, stackTrace: stackTrace);
  }

  void info(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.i(message, error: error, stackTrace: stackTrace);
  }

  void warning(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  void error(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }
}

extension LogLevelToImplLevelExtension on LogLevel {
  logger_impl.Level toImpl() {
    switch (this) {
      case LogLevel.debug:
        return logger_impl.Level.debug;
      case LogLevel.info:
        return logger_impl.Level.info;
      case LogLevel.warning:
        return logger_impl.Level.warning;
    }
  }
}
