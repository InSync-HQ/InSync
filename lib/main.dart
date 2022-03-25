import 'package:flutter/material.dart';
import 'package:insync/view/authorization.dart';
import 'package:insync/utils/theme_config.dart';
import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'InSync',
      theme: lighttheme,
      home: const AppStartsHere(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppStartsHere extends StatefulWidget {
  const AppStartsHere({Key? key}) : super(key: key);

  @override
  State<AppStartsHere> createState() => _AppStartsHereState();
}

class _AppStartsHereState extends State<AppStartsHere> {
  @override
  Widget build(BuildContext context) {
    return const Authorization();
  }
}
