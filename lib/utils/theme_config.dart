import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xff1A1A1A)),
    helperStyle: TextStyle(color: Color(0xff656E85)),
    hintStyle: TextStyle(color: Color(0xff656E85)),
    filled: true,
    isDense: true,
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
    foregroundColor: Color(0xFF1A1A1A),
    backgroundColor: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
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

ThemeData darktheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  cardTheme: const CardTheme(
    shadowColor: Color(0x1100d2ff),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    elevation: 10,
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  scaffoldBackgroundColor: Colors.black,
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xffffffff)),
    helperStyle: TextStyle(color: Color(0xff656E85)),
    hintStyle: TextStyle(color: Color(0xff656E85)),
    prefixIconColor: Color(0xff656E85),
    filled: true,
    isDense: true,
    fillColor: Colors.black,
    hoverColor: Colors.black,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Color.fromARGB(255, 61, 61, 61)),
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
  //done
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
    backgroundColor: Color(0xFF1A1A1A),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(
      color: Colors.white,
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
  //done
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey.shade900,
    elevation: 0,
    selectedItemColor: const Color(0xff2dadc2),
  ),
);
