import 'dart:async';

import 'package:flutter/material.dart';

class Timerp extends StatefulWidget {
  const Timerp({super.key, required this.terminateTimer});
  final Function terminateTimer;

  @override
  State<Timerp> createState() => _TimerpState();
}

class _TimerpState extends State<Timerp> {
  double _progress = 0.1;
  int _secondsRemaining = 3600;
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), (Timer t) {
      if (_secondsRemaining == 0) {
        t.cancel();
        widget.terminateTimer();
      } else {
        setState(() {
          _secondsRemaining--;
          _progress = _secondsRemaining / 3600;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            strokeWidth: 10,
            strokeCap: StrokeCap.round,
            backgroundColor: Colors.purple[100]?.withOpacity(.5),
            value: _progress,
          ),
          Center(
            child: Text(
              "${(_secondsRemaining ~/ 60).toString().padLeft(2, '0')}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}",
              style: TextStyle(
                  fontSize: 40, color: _secondsRemaining < 600 ? Colors.pink[400] : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
