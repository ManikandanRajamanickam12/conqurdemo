import 'dart:async';

import 'package:flutter/widgets.dart';

enum Direction { UP, DOWN }

class CountUp extends StatefulWidget {
  // Length of the timer
  final int seconds;

  final Direction direction;

  // Build method for the timer
  final Widget Function(BuildContext, double) build;

  // Called when finished
  final Function? onFinished;

  // Called when time changes
  final ValueChanged<double>? onChanged;

  // Build interval
  final Duration interval;

  // Controller
  final CountdownController? controller;

  CountUp({
    Key? key,
    required this.seconds,
    required this.build,
    this.onChanged,
    this.direction = Direction.UP,
    this.interval = const Duration(seconds: 1),
    this.onFinished,
    this.controller,
  }) : super(key: key);

  @override
  _CountUpState createState() => _CountUpState();
}

///
/// State of timer
///
class _CountUpState extends State<CountUp> {
  // Multiplier of secconds
  final int _secondsFactor = 1000000;

  // Timer
  Timer? _timer;

  // Current seconds
  int? _currentMicroSeconds;

  @override
  void initState() {
    setCurrentTime();

    widget.controller?.setOnPause(_onTimerPaused);
    widget.controller?.setOnResume(_onTimerResumed);
    widget.controller?.setOnRestart(_onTimerRestart);
    widget.controller?.isCompleted = false;

    _startTimer();

    super.initState();
  }

  void setCurrentTime() {
    if (widget.direction == Direction.UP) {
      _currentMicroSeconds = 0;
    } else if (widget.direction == Direction.DOWN) {
      _currentMicroSeconds = widget.seconds * _secondsFactor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(
      context,
      _currentMicroSeconds! / _secondsFactor,
    );
  }

  @override
  void dispose() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }

    super.dispose();
  }

  ///
  /// Then timer paused
  ///
  void _onTimerPaused() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }
  }

  ///
  /// Then timer resumed
  ///
  void _onTimerResumed() {
    _startTimer();
  }

  ///
  /// Then timer restarted
  ///
  void _onTimerRestart() {
    widget.controller?.isCompleted = false;

    setState(() {
      setCurrentTime();
    });

    _startTimer();
  }

  ///
  /// Start timer
  ///
  void _startTimer() {
    if (_timer?.isActive == true) {
      _timer!.cancel();

      widget.controller?.isCompleted = true;
    }
    if (widget.direction == Direction.UP) {
      if (_currentMicroSeconds! < widget.seconds * _secondsFactor) {
        _timer = Timer.periodic(
          widget.interval,
          (Timer timer) {
            if (_currentMicroSeconds == widget.seconds * _secondsFactor) {
              timer.cancel();

              if (widget.onFinished != null) {
                widget.onFinished!();
              }

              widget.controller?.isCompleted = true;
            } else {
              _currentMicroSeconds =
                  _currentMicroSeconds! + widget.interval.inMicroseconds;
              setState(() {});
              widget.onChanged!(_currentMicroSeconds! / _secondsFactor);
            }
          },
        );
      }
    } else if (widget.direction == Direction.DOWN) {
      if (_currentMicroSeconds != 0) {
        _timer = Timer.periodic(
          widget.interval,
          (Timer timer) {
            if (_currentMicroSeconds == 0) {
              timer.cancel();

              if (widget.onFinished != null) {
                widget.onFinished!();
              }

              widget.controller?.isCompleted = true;
            } else {
              setState(() {
                _currentMicroSeconds =
                    _currentMicroSeconds! - widget.interval.inMicroseconds;
              });
            }
          },
        );
      }
    }
  }
}

///
/// Controller for Count down
///
class CountdownController {
  // Called when called `pause` method
  VoidCallback? onPause;

  // Called when called `resume` method
  VoidCallback? onResume;

  // Called when restarting the timer
  VoidCallback? onRestart;

  ///
  /// Checks if the timer is running and enables you to take actions according to that.
  /// if the timer is still active, `isCompleted` returns `false` and vice versa.
  ///
  /// for example:
  ///
  /// ``` dart
  ///   _controller.isCompleted ? _controller.restart() : _controller.pause();
  /// ```
  ///
  bool? isCompleted;

  ///
  /// Constructor
  ///
  CountdownController();

  ///
  /// Set timer in pause
  ///
  pause() {
    if (this.onPause != null) {
      this.onPause!();
    }
  }

  setOnPause(VoidCallback onPause) {
    this.onPause = onPause;
  }

  ///
  /// Resume from pause
  ///
  resume() {
    if (this.onResume != null) {
      this.onResume!();
    }
  }

  setOnResume(VoidCallback onResume) {
    this.onResume = onResume;
  }

  ///
  /// Restart timer from cold
  ///
  restart() {
    if (this.onRestart != null) {
      this.onRestart!();
    }
  }

  setOnRestart(VoidCallback onRestart) {
    this.onRestart = onRestart;
  }
}
