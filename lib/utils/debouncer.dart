import 'dart:async';
import 'dart:ui';

class Debouncer {
  final int milliseconds;
  late Timer _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
