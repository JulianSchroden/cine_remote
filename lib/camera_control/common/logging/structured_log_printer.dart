import 'package:logger/logger.dart';

import '../extensions/list_extensions.dart';

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

class CallerInfo {
  final String method;
  final String file;

  CallerInfo(this.method, this.file);
}
