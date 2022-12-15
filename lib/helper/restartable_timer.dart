import 'dart:async';

class RestartableTimer implements Timer {
  Duration duration;
  final ZoneCallback callback;
  Timer? _timer;
  int? _timerInSecond;
  late Function(int? tick) _tickerCallback;
  bool _isListenerTimer = false;
  RestartableTimer(this.duration, this.callback) {
    _timer = Timer(duration, callback);
  }

  RestartableTimer.listen({
    required this.duration,
    required this.callback,
    required Function(int? tick) tick,
  }) {
    _timer?.cancel();
    _tickerCallback = tick;
    _isListenerTimer = true;
    _timerInSecond = duration.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      var timerSecond = _timerInSecond;
      if (timerSecond != null) {
        timerSecond--;
        _timerInSecond = timerSecond;
        _tickerCallback(_timerInSecond);
        if (_timerInSecond == 0) {
          (this).callback();
          _timer!.cancel();
        }
      }
    });
  }

  @override
  bool get isActive => _timer!.isActive;

  void reset() {
    _timer!.cancel();
    if (_isListenerTimer) {
      _timerInSecond = (this).duration.inSeconds;
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        var timerSecond = _timerInSecond;
        if (timerSecond != null) {
          timerSecond--;
          _timerInSecond = timerSecond;
          // _timerInSecond--;
          _tickerCallback(_timerInSecond);
          if (_timerInSecond == 0) {
            (this).callback();
            _timer!.cancel();
          }
        }
      });
    } else {
      _timer = Timer((this).duration, (this).callback);
    }
  }

  @override
  void cancel() {
    if (_timer != null) _timer!.cancel();
  }

  void changeDuration(Duration newDuration) {
    (this).duration = newDuration;
    (this).reset();
  }

  void destroy(RestartableTimer? currentInstance) {
    currentInstance = null;
  }

  @override
  // Dart 2.0 requires this method to be implemented.
  // See https://github.com/dart-lang/sdk/issues/31664
  // ignore: override_on_non_overriding_getter
  int get tick {
    throw UnimplementedError('tick');
  }
}
