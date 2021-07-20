import 'dart:async';

class TimerUtility {
  splashTimer({required dynamic callBack, required int seconds}) {
    return Timer(Duration(seconds: seconds), callBack);
  }
}
