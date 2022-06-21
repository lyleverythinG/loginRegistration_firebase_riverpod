import 'dart:async';
import 'package:flutter/material.dart';
import 'home/homeflow.dart';

class LoadingScreen extends StatefulWidget {
  static const String route = '/loading';
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Timer? _timer;

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () async {
      Navigator.pushReplacementNamed(context, HomeFlow.route);
    });
    super.initState();
  }

  @override
  void dispose() {
    //dispose after to release resources. No Need to use flutter hooks at the moment because this is the only class we are implementing the timer.
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
