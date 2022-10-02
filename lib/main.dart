import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insync/utils/constants.dart';
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
// import 'package:stacked_themes/stacked_themes.dart';

main() async {
  // necessary for get storage works like shared prefs
  await GetStorage.init();
  // necessary for theme builder
  // await ThemeManager.initialise();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int? theme;
  // ThemeMode? thememode;

  @override
  void initState() {
    // initialization();
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
      // darkTheme: darkTheme,
      // themeMode: themeMode,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      // themeMode: Provider.of<ThemeNotifier>(context).currentTheme,
    );
    // return ThemeBuilder(
    //   defaultThemeMode: ThemeMode.light,
    //   lightTheme: lighttheme,
    //   darkTheme: darktheme,
    //   // themes: getThemes(),
    //   builder: (context, lightTheme, darkTheme, themeMode) {
    //     return GetMaterialApp(
    //       // routes
    //       routes: {
    //         '/authorization': (context) => const Authorization(),
    //         '/mainapp': (context) => const MainApp(),
    //         '/editprofile': (context) => const EditProfile(),
    //         '/aboutus': (context) => const AboutUs(),
    //         '/discover': (context) => const DiscoverCommunity(),
    //         '/interests': (BuildContext context) => const Addinterests(),
    //         '/changeinterests': (BuildContext context) =>
    //             const ChangeInterests(),
    //         '/onboarding/1': (BuildContext context) => const Onboardingpage1(),
    //         '/onboarding/2': (BuildContext context) => const Onboardingpage2(),
    //         '/onboarding/3': (BuildContext context) => const Onboardingpage3(),
    //       },
    //       title: 'InSync',
    //       theme: lightTheme,
    //       // darkTheme: darkTheme,
    //       // themeMode: themeMode,
    //       home: const InSync(),
    //       debugShowCheckedModeBanner: false,
    //       // themeMode: Provider.of<ThemeNotifier>(context).currentTheme,
    //     );
    //   },
    // );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeout() {
    return Timer(const Duration(milliseconds: 2200), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    bool? auth = await Constants.retrieveAuthPref();
    if (auth == true) {
      Get.to(() => const MainApp());
    } else {
      Get.to(() => const Authorization());
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
    Constants.themeSystemPref();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
