import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:seohyang/endbtn.dart';
import 'package:seohyang/hint.dart';
import 'package:seohyang/timer_buttion.dart';
import 'package:seohyang/timerp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Pretendard",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _onProgress = false;
  void showTimer() {
    setState(() {
      _onProgress = true;
      _circularWidget = Timerp(
        terminateTimer: terminateTimer,
      );
    });
  }

  void terminateTimer() {
    setState(() {
      _onProgress = true;
      _circularWidget = Endbtn();
    });
  }

  late Widget _circularWidget;
  @override
  void initState() {
    // TODO: implement initState
    _circularWidget = TimerButtion(startTimer: showTimer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Align(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _circularWidget,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: !_onProgress
                    ? SizedBox()
                    : Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
                        child: Hint(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
