import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Image(image: AssetImage('assets/readwell.png')),
              const Text(
                "Read Well",
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const Text("Stay relevant with all the news you like",
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
