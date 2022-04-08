import 'package:flutter/material.dart';
import 'package:insync/utils/constants.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:insync/view/app_structure.dart';
import 'package:insync/view/authorization.dart';
import 'package:insync/utils/theme_config.dart';
import 'package:insync/view/edit_profile.dart';
import 'package:insync/view/splash.dart';
import 'dart:async';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes
      routes: {
        '/authorization': (context) => const Authorization(),
        '/mainapp': (context) => const MainApp(),
        '/editprofile': (context) => const EditProfile(),
      },
      title: 'InSync',
      theme: lighttheme,
      darkTheme: darktheme,
      home: const InSync(),
    );
  }
}

class InSync extends StatefulWidget {
  const InSync({Key? key}) : super(key: key);

  @override
  State<InSync> createState() => _InSyncState();
}

class _InSyncState extends State<InSync> {
  startTimeout() {
    return Timer(const Duration(milliseconds: 2200), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    bool? auth = await Constants.retrieveAuthPref();
    if (auth == true) {
      Navigator.pushNamed(context, '/mainapp');
    } else {
      Navigator.pushNamed(context, '/authorization');
    }
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
    initialization();
  }

  void initialization() async {
    setState(() {});
    // FlutterNativeSplash.remove();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
