import 'package:logger/logger.dart';

import '../../common/list_extensions.dart';

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

class CallerInfo {
  final String method;
  final String file;

  CallerInfo(this.method, this.file);
}

class StructuredLogPrinter extends PrettyPrinter {
  @override
  List<String> log(LogEvent event) {
    List<String> buffer = ['\n'];

    final callerInfo = getCallerInfo(event.stackTrace ?? StackTrace.current);
    buffer.add(buildStartLine(event.level, callerInfo));

    final errorString = event.error?.toString();
    if (errorString != null) {
      for (final errorLine in errorString.split('\n')) {
        buffer.add('  $errorLine');
      }
    }

    final messageString = stringifyMessage(event.message);
    for (final messageLine in messageString.split('\n')) {
      buffer.add('  $messageLine');
    }

    return buffer;
  }

  String buildStartLine(Level level, CallerInfo? callerInfo) {
    if (callerInfo == null) {
      return '[${level.name}] Unknown method';
    }
    return '[${level.name}] ${callerInfo.method} ${callerInfo.file}';
  }

  CallerInfo? getCallerInfo(StackTrace stackTrace) {
    final stackTraceLines = stackTrace.toString().split('\n');
    String callerTrace;

    final lastInternalTraceIndex =
        stackTraceLines.lastIndexWhere((trace) => trace.contains('Logger.'));

    if (lastInternalTraceIndex != -1) {
      final hasTraceAfterInternalTrace =
          lastInternalTraceIndex + 1 < stackTraceLines.lastIndex;

      callerTrace = hasTraceAfterInternalTrace
          ? stackTraceLines[lastInternalTraceIndex + 1]
          : stackTraceLines[lastInternalTraceIndex];
    } else {
      callerTrace = stackTraceLines.first;
    }

    final traceRegex = RegExp(r'#[0-9]+[\s]+(.+)[\s]+(.+)');
    final traceMatch = traceRegex.matchAsPrefix(callerTrace);
    if (traceMatch == null || traceMatch.groupCount < 2) {
      return null;
    }

    return CallerInfo(traceMatch.group(1)!, traceMatch.group(2)!);
  }
}

class CameraControlLogger {
  static final CameraControlLogger instance = CameraControlLogger();

  final Logger _logger = Logger(
    printer: StructuredLogPrinter(),
  );

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
