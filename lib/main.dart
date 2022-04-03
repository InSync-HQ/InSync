import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:insync/view/authorization.dart';
import 'package:insync/utils/theme_config.dart';
import 'package:insync/view/splash.dart';
import 'dart:async';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InSync',
      theme: lighttheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  startTimeout() {
    return Timer(const Duration(milliseconds: 2200), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const Authorization()));
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
    initialization();
  }

  void initialization() async {
    setState(() {});
    FlutterNativeSplash.remove();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
