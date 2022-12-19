import 'package:fimber/fimber.dart';

class Logger {
  /// Logs VERBOSE level [message] with optional exception and stacktrace
  static void v(String message, {ex, StackTrace? stacktrace}) {
    return Fimber.v(message, ex: ex, stacktrace: stacktrace);
  }

  /// Logs ERROR level [message]. Please fill [ex] (exception) and [stacktrace]
  /// so it will record them to Crashlytics.
  static void e(String message, {ex, StackTrace? stacktrace}) {
    return Fimber.e(message, ex: ex, stacktrace: stacktrace);
  }

  /// Logs INFO level [message] with optional exception and stacktrace
  static void i(String message, {ex, StackTrace? stacktrace}) {
    return Fimber.i(message, ex: ex, stacktrace: stacktrace);
  }

  /// Logs WARNING level [message]. Please fill [ex] (exception) and [stacktrace]
  /// so it will record them to Crashlytics.
  static void w(String message, {ex, StackTrace? stacktrace}) {
    return Fimber.w(message, ex: ex, stacktrace: stacktrace);
  }

  /// Logs DUBUG level [message] with optional exception and stacktrace
  static void d(String message, {ex, StackTrace? stacktrace}) {
    return Fimber.d(message, ex: ex, stacktrace: stacktrace);
  }
}
