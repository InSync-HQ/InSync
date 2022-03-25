// import 'package:insync/utils/Constants.dart';
import 'package:flutter/material.dart';

// // dark mode switch
// enum MyTheme { light, dark }
// String? _darkmode = Constants.prefs.getString("darkmode");

// class ThemeNotifier extends ChangeNotifier {
//   static List<ThemeData> themes = [
//     //light theme
//     ThemeData(
//       dividerColor: Colors.transparent,
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       cardTheme: const CardTheme(
//         shadowColor: Color(0x1100d2ff),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//         ),
//         elevation: 10,
//       ),
//       inputDecorationTheme: const InputDecorationTheme(
//         hintStyle: TextStyle(
//           color: Color(0xffCBC6CB),
//         ),
//         filled: true,
//         fillColor: Colors.white,
//         // fillColor: Color(0xffF3F0F4),
//         hoverColor: Colors.white,
//         alignLabelWithHint: true,
//         border: InputBorder.none,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(50.0)),
//           borderSide: BorderSide(color: Color(0xffF3F0F4)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(50.0)),
//           borderSide: BorderSide(color: Color(0xffF3F0F4)),
//         ),
//       ),
//       bottomAppBarTheme: const BottomAppBarTheme(
//         color: Colors.white,
//         elevation: 0,
//       ),
//       appBarTheme: const AppBarTheme(
//         color: Color(0xffF7F7FF),
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//       ),
//       primaryColor: const Color(0xff2dadc2),
//       primaryColorLight: const Color(0xff00d2ff),
//       primaryColorDark: const Color(0xff0052ff),
//       scaffoldBackgroundColor: const Color(0xffF7FAFF),
//       fontFamily: 'GeneralSans',
//       brightness: Brightness.light,
//       backgroundColor: const Color(0xff393E46),
//       floatingActionButtonTheme: const FloatingActionButtonThemeData(
//         elevation: 0,
//         backgroundColor: Color(0xff2dadc2),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//         ),
//         foregroundColor: Colors.white,
//       ),
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         selectedItemColor: Color(0xff2dadc2),
//       ),
//     ),
//     //dark theme
//     ThemeData(
//       dividerColor: Colors.transparent,
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       cardTheme: const CardTheme(
//         color: Color(0xff1d1d1d),
//         shadowColor: Color(0x00333333),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//         ),
//         elevation: 0,
//       ),
//       floatingActionButtonTheme: const FloatingActionButtonThemeData(
//         elevation: 4,
//         backgroundColor: Color(0xff2dadc2),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//         ),
//         foregroundColor: Colors.white,
//       ),
//       appBarTheme: const AppBarTheme(
//         color: Colors.black45,
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//         actionsIconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//       ),
//       inputDecorationTheme: const InputDecorationTheme(
//         hintStyle: TextStyle(
//           color: Color(0xff555555),
//         ),
//         filled: true,
//         fillColor: Color(0xff272727),
//         hoverColor: Colors.white,
//         alignLabelWithHint: true,
//         border: InputBorder.none,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(50.0)),
//           borderSide: BorderSide(color: Color(0x00000000)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(50.0)),
//           borderSide: BorderSide(color: Color(0x00000000)),
//         ),
//       ),
//       primaryColor: const Color(0xff2dadc2),
//       primaryColorLight: const Color(0xff00d2ff),
//       primaryColorDark: const Color(0xff0052ff),
//       scaffoldBackgroundColor: const Color(0xff040505),
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         backgroundColor: Colors.black45,
//         elevation: 0,
//         selectedItemColor: Color(0xff2dadc2),
//       ),
//       fontFamily: 'GeneralSans',
//       brightness: Brightness.dark,
//       backgroundColor: const Color(0xffffffff),
//     ),
//   ];

//   MyTheme _current = (_darkmode == "false" || _darkmode == null)
//       ? MyTheme.light
//       : MyTheme.dark;
//   // MyTheme _current = MyTheme.Light;
//   ThemeData _currentTheme =
//       (_darkmode == "false" || _darkmode == null) ? themes[0] : themes[1];
//   // MyTheme _current = MyTheme.Dark;
//   // ThemeData _currentTheme = themes[1];

//   set currentTheme(theme) {
//     if (theme != null) {
//       _current = theme;
//       _currentTheme = _current == MyTheme.light ? themes[0] : themes[1];
//       notifyListeners();
//     }
//   }

//   get myTheme => _current;

//   ThemeData get currentTheme => _currentTheme;

//   void switchTheme() {
//     if (_current == MyTheme.light) {
//       Constants.prefs.setString("darkmode", "true");
//       currentTheme = MyTheme.dark;
//     } else {
//       Constants.prefs.setString("darkmode", "false");
//       currentTheme = MyTheme.light;
//     }
//   }
// }

//light theme
ThemeData lighttheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  cardTheme: const CardTheme(
    shadowColor: Color(0x1100d2ff),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    elevation: 10,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xff1A1A1A)),
    helperStyle: TextStyle(color: Color(0xff656E85)),
    hintStyle: TextStyle(color: Color(0xff656E85)),
    filled: true,
    fillColor: Colors.white,
    hoverColor: Colors.white,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Color(0xffE2E4E8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Color(0xff2561ED)),
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
    elevation: 0,
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 255, 255, 255),
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  primaryColor: const Color(0xffFD4C62),
  fontFamily: 'General Sans',
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: Color(0xff2dadc2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    foregroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    selectedItemColor: Color(0xff2dadc2),
  ),
);
