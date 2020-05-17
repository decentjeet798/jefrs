import 'package:flutter/material.dart';
import 'responsive.dart';

class TextStyles {
  TextStyles._();

  static const Color primaryColor = Colors.white;
  static const Color facebook = Color(0xFF3B5999);
  static const Color google = Color(0xFFD64832);
  static const Color secondryColor = Color(0xFF565656);

  static final TextStyle bottomNavStyle = TextStyle(
    fontSize: 1.9 * SizeConfig.textMultiplier,
  );

  static final TextStyle contactUsStyle = TextStyle(
    color: Colors.black87,
    fontFamily: 'Metropolis',
    height: 1.4,
  );

  static final TextStyle referalCodeTextStyle = TextStyle(
    fontSize: SizeConfig.textMultiplier * 3,
    fontWeight: FontWeight.w600,
    fontFamily: 'Metropolis',
  );

  static final titleLight = TextStyle(
    fontSize: SizeConfig.fontSize + 10,
    color: primaryColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'Metropolis',
    height: 1.4,
  );

  static final body1 = TextStyle(
    fontSize: SizeConfig.fontSize + 8,
    fontFamily: 'Metropolis',
    height: 1.4,
  );

  static final register = TextStyle(
    fontSize: SizeConfig.fontSize + 8,
    fontFamily: 'Metropolis',
    color: primaryColor,
    height: 1.4,
  );

  static final location = TextStyle(
    fontSize: SizeConfig.fontSize + 10,
    fontFamily: 'Metropolis',
    color: primaryColor,
    height: 1.4,
  );

  static final bodyLight = TextStyle(
    fontSize: 1.8 * SizeConfig.textMultiplier,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontFamily: 'Metropolis',
    height: 1.4,
  );

  static final loginHeading = TextStyle(
    fontSize: 3.6 * SizeConfig.textMultiplier,
    color: primaryColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Metropolis',
    height: 1.4,
  );

  // static final _heading = TextStyle(
  //   fontSize: 2 * SizeConfig.textMultiplier,
  //   color: primaryColor,
  //   fontFamily: 'Metropolis',
  //   height: 1.4,
  // );

  static final titleOfCat = TextStyle(
    fontSize: SizeConfig.fontSize + 10,
    color: primaryColor,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0,
    fontFamily: 'Metropolis',
    height: 1.4,
  );

  // static final _primaryText = TextStyle(
  //   color: primaryColor,
  //   fontSize: 3 * SizeConfig.textMultiplier,
  // );

  static final bodyText = TextStyle(
    color: Colors.black,
    fontSize: 1.7 * SizeConfig.textMultiplier,
    fontFamily: 'Metropolis',
  );

  // static final _display1 = TextStyle(
  //   color: primaryColor,
  //   fontSize: 5.0 * SizeConfig.textMultiplier,
  //   fontWeight: FontWeight.w200,
  //   fontFamily: 'Metropolis',
  // );

  static final facebookButton = TextStyle(
    fontSize: 1.9 * SizeConfig.textMultiplier,
    color: facebook,
    fontFamily: 'Metropolis',
    height: 1.4,
  );

  static final loginButton = TextStyle(
    fontSize: 1.9 * SizeConfig.textMultiplier,
    color: primaryColor,
    fontFamily: 'Metropolis',
    height: 1.4,
  );

  static final googleButton = TextStyle(
    fontSize: 1.9 * SizeConfig.textMultiplier,
    color: google,
    fontFamily: 'Metropolis',
    height: 1.4,
  );
}
