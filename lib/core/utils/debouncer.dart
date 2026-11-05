import 'dart:async';

class Debouncer {
  Debouncer({this.duration = 300});
  final int duration;
  Timer? _timer;

  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: duration), action);
  }

  void cancel() => _timer?.cancel();
  void dispose() => _timer?.cancel();
}
