import 'package:flutter/material.dart';

class TimerButtion extends StatelessWidget {
  const TimerButtion({super.key, required this.startTimer});
  final Function startTimer;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(300),
          color: Colors.purple[100],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(300),
            onTap: () {
              Future.delayed(const Duration(milliseconds: 200), () {
                startTimer();
              });
            },
            splashColor: Colors.purple[200],
            child: SizedBox(
              width: 200,
              height: 200,
              child: Center(
                child: Text(
                  "시작",
                  style: TextStyle(
                      fontSize: 40, color: Colors.purple[900], fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
