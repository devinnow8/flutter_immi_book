import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

double designScreenWidth = 1920; //figma design width
double designScreenHeight = 11096; //figma design height
double designHorizontalPadding = 225;

double appbarHeight = 80;

double desktopWidth = 1920;
double tabletWidth = 1280;
double mobileWidth = 787;

double desktopSubSectionWidth = 1291;

const Color accentColor = Color.fromRGBO(183, 119, 234, 1);

// ThemeData tmpThemeData = ThemeData(
//   brightness: Brightness.dark,
//   visualDensity: VisualDensity.adaptivePlatformDensity,
//   useMaterial3: true,
//   colorScheme: ColorScheme(brightness: Brightness.dark,
//                             primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface)
//
// )

double scrollbarThickness = 15;

double getMaxWidth(context) {
  if (getScreenWidth(context: context) >= 1920) {
    return (1920 - 207 * 2 - scrollbarThickness);
  } else
    return (1920 - 207 * 2 - scrollbarThickness);
}

double getSubsectionWidth(context) {
  if (getScreenWidth(context: context) >= 1920) {
    return desktopSubSectionWidth;
  } else if (getScreenWidth(context: context) >= 1600) {
    return desktopSubSectionWidth;
  } else if (getScreenWidth(context: context) >= 1400) {
    return desktopSubSectionWidth;
  } else if (getScreenWidth(context: context) >= 1000) {
    return desktopSubSectionWidth * textScaleF2F(context: context) * 1.2;
  } else if (getScreenWidth(context: context) >= 786) {
    return desktopSubSectionWidth * textScaleF2F(context: context) * 1.2;
  }
  return desktopSubSectionWidth * 0.98;
}
