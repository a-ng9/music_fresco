// import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';

bool startPressed = true;
bool stopPressed = true;
bool resetPressed = true;
final dur = const Duration(seconds: 1);
String stopTimeDisplay = "00:00:00";
var swatch = Stopwatch();

class StopWatchTimer extends StatefulWidget {
  @override
  _StopWatchTimerState createState() => _StopWatchTimerState();
}

class _StopWatchTimerState extends State<StopWatchTimer> {
  void actTimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (swatch.isRunning) {
      actTimer();
    }
    setState(() {
      stopTimeDisplay = swatch.elapsed.inHours.toString().padLeft(2, "0") +
          ":" +
          (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
          ":" +
          (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    });
  }

  void startTimer() {
    setState(() {
      stopPressed = false;
      startPressed = false;
    });
    swatch.start();
    actTimer();
  }

  void stopTimer() {
    setState(() {
      stopPressed = true;
      resetPressed = false;
      startPressed = true;
    });
    swatch.stop();
  }

  void resetTimer() {
    setState(() {
      startPressed = true;
      resetPressed = true;
    });
    swatch.reset();
    actTimer();
    stopTimeDisplay = "00:00:00";
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
