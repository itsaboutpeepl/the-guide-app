import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final FlexColorScheme flexColorSchemeLight = FlexColorScheme.light(
  fontFamily: 'Europa',
  colors: FlexSchemeColor.from(
    secondary: Color(0xFFF5F5F5),
    secondaryVariant: Color(0xFF777777),
    primary: Color(0xFF011C35), //makes 'Feed' text white
    primaryVariant: Color(0xFF011C35),
    appBarColor: Color(0xFFFFFFFF),
  ),
);
