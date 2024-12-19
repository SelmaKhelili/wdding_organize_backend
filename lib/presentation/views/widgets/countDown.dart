import 'package:flutter/material.dart';
import 'dart:async';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late Timer _timer;
  Duration _timeLeft = const Duration(days: 30, hours: 1, minutes: 59);

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft.inSeconds > 0) {
        setState(() {
          _timeLeft = _timeLeft - const Duration(seconds: 1);
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: 200,
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 118, 157),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _timeSegment("${_timeLeft.inDays.toString().padLeft(2, '0')}"),
            const Text(" : "),
            _timeSegment(
                "${(_timeLeft.inHours % 24).toString().padLeft(2, '0')}"),
            const Text(" : "),
            _timeSegment(
                "${(_timeLeft.inMinutes % 60).toString().padLeft(2, '0')}"),
          ],
        ),
      ),
    );
  }

  Widget _timeSegment(String value) {
    return Text(
      value,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
