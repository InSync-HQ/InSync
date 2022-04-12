import 'package:flutter/material.dart';
import 'package:insync/utils/constants.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:insync/view/app_structure.dart';
import 'package:insync/view/authorization.dart';
import 'package:insync/utils/theme_config.dart';
import 'package:insync/view/profile/aboutus.dart';
import 'package:insync/view/profile/edit_profile.dart';
import 'package:insync/view/splash.dart';
import 'dart:async';
import 'package:stacked_themes/stacked_themes.dart';

Future main() async {
  await ThemeManager.initialise();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => ThemeNotifier()),
  //     ],
  //     child: const MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? theme;
  ThemeMode? thememode;

  @override
  void initState() {
    // initialization();
    super.initState();
  }

  // void initialization() async {
  //   if (await Constants.retrievethemePref() == null) {
  //     print("null call");
  //     theme = 1;
  //   } else {
  //     theme = await Constants.retrievethemePref();
  //   }
  //   print("Theme number is: ");
  //   print(theme);
  //   if (theme == 1) {
  //     setState(() {
  //       thememode = ThemeMode.system;
  //     });
  //   }
  //   if (theme == 2) {
  //     setState(() {
  //       thememode = ThemeMode.light;
  //     });
  //   }
  //   if (theme == 3) {
  //     setState(() {
  //       thememode = ThemeMode.dark;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      lightTheme: lighttheme,
      darkTheme: darktheme,
      // themes: getThemes(),
      builder: (context, lightTheme, darkTheme, themeMode) {
        return MaterialApp(
          // routes
          routes: {
            '/authorization': (context) => const Authorization(),
            '/mainapp': (context) => const MainApp(),
            '/editprofile': (context) => const EditProfile(),
            '/aboutus': (context) => const AboutUs(),
          },
          title: 'InSync',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: const InSync(),
          // themeMode: Provider.of<ThemeNotifier>(context).currentTheme,
        );
      },
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
    Constants.themeSystemPref();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
