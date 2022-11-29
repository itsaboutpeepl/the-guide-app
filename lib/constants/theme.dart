import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final FlexColorScheme flexColorSchemeLight = FlexColorScheme.light(
  fontFamily: 'Europa',
  colors: FlexSchemeColor.from(
    secondary: Color(0xFFF5F5F5),
    secondaryContainer: Color(0xFF777777),
    primary: Color(0xFF011C35), //makes 'Feed' text white
    primaryContainer: Color(0xFF011C35),
    appBarColor: Color(0xFFFFFFFF),
  ),
);

const Color pplRed = Color(0xFFEA4953);
