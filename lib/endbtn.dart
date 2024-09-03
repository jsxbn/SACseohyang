import 'package:flutter/material.dart';

class Endbtn extends StatelessWidget {
  const Endbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(300),
          color: Colors.red[100],
        ),
        child: Center(
          child: Text(
            "시간 종료",
            style: TextStyle(fontSize: 30, color: Colors.red[900], fontWeight: FontWeight.w600),
          ),
        ));
  }
}
