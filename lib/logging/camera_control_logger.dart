import 'package:camera_control_dart/camera_control_dart.dart' as camera_control;
import 'package:cine_remote/logging/logger.dart';

class CameraControlLoggerImpl extends camera_control.CameraControlLogger {
  final Logger logger;

  CameraControlLoggerImpl(this.logger);

  @override
  void log<C extends camera_control.LoggerChannel>(
    camera_control.LogLevel level,
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.log(level.toCommon(), message, error, stackTrace);
  }

  @override
  void info<C extends camera_control.LoggerChannel>(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.info(message, error, stackTrace);
  }

  @override
  void warning<C extends camera_control.LoggerChannel>(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    logger.warning(message, error, stackTrace);
  }
}

extension LogLevelToCommonLevelExtension on camera_control.LogLevel {
  LogLevel toCommon() {
    switch (this) {
      case camera_control.LogLevel.info:
        return LogLevel.info;
      case camera_control.LogLevel.warning:
        return LogLevel.warning;
    }
  }
}
