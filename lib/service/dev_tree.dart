import 'dart:developer' as dev;

import 'package:fimber/fimber.dart';

class DevTree extends LogTree {
  final List<String> logLevels;
  final int printType;
  final bool useColor;
  DevTree({
    this.logLevels = defaultLevels,
    this.printType = timeClockType,
    this.useColor = true,
  }) {
    if (useColor) colorizeMap = _defaultColorizeMap;
  }

  static const defaultLevels = ['D', 'I', 'W', 'E'];
  static const int timeClockType = 1;
  Map<String, ColorizeStyle> colorizeMap = {};

  static final Map<String, ColorizeStyle> _defaultColorizeMap = {
    'V': ColorizeStyle([AnsiStyle.foreground(AnsiColor.blue)]),
    'I': ColorizeStyle([AnsiStyle.bright(AnsiColor.blue)]),
    'D': ColorizeStyle([AnsiStyle.foreground(AnsiColor.green)]),
    'W': ColorizeStyle([AnsiStyle.foreground(AnsiColor.yellow)]),
    'E': ColorizeStyle([AnsiStyle.bright(AnsiColor.red)])
  };

  void printLog(String logLine, {String? logLevel}) {
    var printableLine = logLine;
    var date = DateTime.now().toIso8601String();

    String levelLog() {
      switch (logLevel) {
        case 'D':
          return 'DEBUG';
        case 'I':
          return 'INFO';
        case 'V':
          return 'VERBOSE';
        case 'E':
          return 'ERROR';
        case 'W':
          return 'WARNING';
        default:
          return '—';
      }
    }

    // printableLine =
    //     '——————————————————————————————————————————————————————————————————————\n'
    //     '\t\t\t\t${levelLog()}\n'
    //     '——————————————————————————————————————————————————————————————————————\n'
    //     '\t\t\t$date\n'
    //     '——————————————————————————————————————————————————————————————————————\n'
    //     '$printableLine\n'
    //     '——————————————————————————————————————————————————————————————————————';

    printableLine =
        '——————————————————————————————————————————————————————————————————————\n'
        '\t\t\t\t${levelLog()}\n'
        '——————————————————————————————————————————————————————————————————————\n'
        '\t\t\t$date\n'
        '——————————————————————————————————————————————————————————————————————\n'
        '$printableLine\n'
        '——————————————————————————————————————————————————————————————————————';

    var colorizeTransform = (logLevel != null) ? colorizeMap[logLevel] : null;
    if (colorizeTransform != null) {
      dev.log(colorizeTransform.wrap(printableLine));
    } else {
      dev.log(printableLine);
    }
  }

  @override
  List<String> getLevels() => logLevels;

  @override
  void log(
    String level,
    String message, {
    String? tag,
    ex,
    StackTrace? stacktrace,
  }) {
    if (ex != null) {
      var tempStacktrace =
          stacktrace?.toString().split('\n') ?? LogTree.getStacktrace();
      var stacktraceMessage =
          tempStacktrace.map((stackLine) => '\t$stackLine').join('\n');

      printLog(
        '$message\n'
        '${ex.toString()}\n$stacktraceMessage',
        logLevel: level,
      );
    } else {
      printLog(message, logLevel: level);
    }
  }
}
