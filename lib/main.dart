import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';
import 'package:insync/view/app_structure.dart';
import 'package:insync/view/auth/authorization.dart';
import 'package:insync/utils/theme_config.dart';
import 'package:insync/view/community/discover_community.dart';
import 'package:insync/view/onboarding/onboarding.dart';
import 'package:insync/view/onboarding/selectinterest.dart';
import 'package:insync/view/profile/aboutus.dart';
import 'package:insync/view/profile/change_intrests.dart';
import 'package:insync/view/profile/edit_profile.dart';
import 'package:insync/view/splash.dart';
import 'dart:async';

main() async {
  // necessary for get storage -> works like shared prefs
  await GetStorage.init();
  // to disable app rotation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const InSync());
}

class InSync extends StatefulWidget {
  const InSync({Key? key}) : super(key: key);

  @override
  State<InSync> createState() => _InSyncState();
}

class _InSyncState extends State<InSync> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // routes
      routes: {
        '/authorization': (context) => const Authorization(),
        '/mainapp': (context) => const MainApp(),
        '/editprofile': (context) => const EditProfile(),
        '/aboutus': (context) => const AboutUs(),
        '/discover': (context) => const DiscoverCommunity(),
        '/interests': (BuildContext context) => const Addinterests(),
        '/changeinterests': (BuildContext context) => const ChangeInterests(),
        '/onboarding/1': (BuildContext context) => const Onboardingpage1(),
        '/onboarding/2': (BuildContext context) => const Onboardingpage2(),
        '/onboarding/3': (BuildContext context) => const Onboardingpage3(),
      },
      title: 'InSync',
      theme: getThemes()[0],
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimeout();
    super.initState();
    setState(() {});
  }

  startTimeout() {
    return Timer(const Duration(milliseconds: 2200), changeScreen);
  }

  changeScreen() async {
    // bool? auth = await Constants.retrieveAuthPref();
    final auth = GetStorage();
    bool? authval = auth.read('auth');
    if (authval == true) {
      Get.to(() => const MainApp());
    } else {
      Get.to(() => const Authorization());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
