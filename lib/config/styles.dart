import 'package:flutter/material.dart';

import '../config/responsive.dart';

import 'responsive.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Colors.white;
  static const Color facebook = Color(0xFF3B5999);
  static const Color google = Color(0xFFD64832);
  static const Color secondryColor = Color(0xFF565656);

  static const LinearGradient happyHoursGradient = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Color.fromRGBO(214, 132, 50, 0.90),
        Color.fromRGBO(247, 31, 46, 0.90),
      ]);

  static final sliverAppBar = AppBar(
    iconTheme: IconThemeData(color: Colors.white),
  );
  // static final TextTheme lightTextTheme = TextTheme(
  //   title: titleLight,
  //   headline: _heading,
  //   button: _primaryText,
  //   body1: bodyText,
  //   display1: _display1,
  // );

  static final IconThemeData appIconTheme = IconThemeData(color: Colors.black87);

  static final ButtonThemeData appButtonTheme = ButtonThemeData();

  static final TabBarTheme appTabBarTheme = TabBarTheme(
    labelColor: primaryColor,
    labelStyle: TextStyle(
      fontSize: 1.9 * SizeConfig.textMultiplier,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    ),
    indicatorSize: TabBarIndicatorSize.label,
    unselectedLabelColor: Colors.grey,
    unselectedLabelStyle: TextStyle(
      fontSize: 1.9 * SizeConfig.textMultiplier,
      fontFamily: 'Metropolis',
    ),
  );

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.all(0.0),
    labelStyle: TextStyle(
      fontFamily: 'Metropolis',
      fontSize: 1.9 * SizeConfig.textMultiplier,
    ),
    hintStyle: TextStyle(
        fontSize: 1.6 * SizeConfig.textMultiplier, fontFamily: 'Metropolis'),
  );

  static final AppBarTheme appBarTheme = AppBarTheme(
    brightness: Brightness.light,
    elevation: 0.0,
    textTheme: TextTheme(),
    iconTheme: IconThemeData(color: primaryColor),
  );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    inputDecorationTheme: inputDecorationTheme,
    appBarTheme: appBarTheme,
    tabBarTheme: appTabBarTheme,
    //textTheme: lightTextTheme,
    primaryColor: primaryColor,
    canvasColor: Colors.white,
    iconTheme: appIconTheme,
    focusColor: Colors.redAccent,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primaryColor),
  );
}
