import 'package:flutter/material.dart';
import 'package:theimmibook/utils/ui_utilities.dart';


//13

double designScreenWidth = 1920; //figma design width
double designScreenHeight = 11096; //figma design height
double designHorizontalPadding = 225;

double appbarHeight = 80;

double desktopWidth = 1920;
double tabletWidth = 1280;
double mobileWidth = 786;

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

double getMaxSectionWidth(context) {
  if (getScreenWidth(context: context) > mobileWidth) {
    return (1920 - 207 * 2 - scrollbarThickness);
  } else
    {
    return (1920 - 207 * 2);
  }
}

bool isMobile(context) {
  if (getScreenWidth(context: context) < mobileWidth) {
    return true;
  }
  return false;
}

double getMaxNetWidth(context) {
  if (getScreenWidth(context: context) > mobileWidth) {
    return getScreenWidth(context: context) - scrollbarThickness;
  } else {
    return getScreenWidth(context: context);
  }
}

double getHorizontalPadding(context) {
  if (getScreenWidth(context: context) < mobileWidth) {
    return 30 * widthScaleF2F(context: context) * 5;
  } //modify later
  else {
    return widthScaleF2F(context: context) * 200;
  }
}


double getSubsectionWidth(context) {
  if (getScreenWidth(context: context) >= 1920) {
    return desktopSubSectionWidth;
  } else if (getScreenWidth(context: context) >= 1600) {
    return desktopSubSectionWidth;
  } else if (getScreenWidth(context: context) >= 1400) {
    return desktopSubSectionWidth;
  } else if (getScreenWidth(context: context) >= 1000) {
    return desktopSubSectionWidth * widthScaleF2F(context: context) * 1.4;
  } else if (getScreenWidth(context: context) >= 786) {
    return desktopSubSectionWidth * widthScaleF2F(context: context) * 1.4;
  }
  return desktopSubSectionWidth * 0.98;
}



////////////////////////////// Colors//////////////////////////////

// misc colors
const Color highlightColor = Color.fromRGBO(214, 239, 55, 1);
const Color imageMaskColor = Color.fromRGBO(19, 19, 63, 0.8);

//gradient colors
const Color gradientPrimaryColor = Color.fromRGBO(119, 119, 228, 1);
const Color gradientSecondaryColor = Color.fromRGBO(74, 74, 204, 1);

//body colors
const Color bodyBgPrimaryColor = Colors.white;
const Color bodyBgSecondaryColor = Color.fromRGBO(223, 223, 255, 1);
const Color bodyBgTertiaryColor = Color.fromRGBO(10, 10, 78, 1);
const Color bodyColorBlue = Color.fromRGBO(70, 70, 182, 1);


//text colors
const Color textColorWhite = Colors.white;
const Color textColorBlack = Colors.black;
const Color textColorBlue = bodyColorBlue;
const Color textColorPurple = Color.fromRGBO(183, 119, 234, 1);

const sectionHeadingStyle =
    TextStyle(fontWeight: FontWeight.w800, fontSize: 60, color: textColorBlack);
const sectionHeadingOptionsStyle =
    TextStyle(fontWeight: FontWeight.w800, fontSize: 30, color: textColorBlack);
const cardTitleStyle =
    TextStyle(fontWeight: FontWeight.w800, fontSize: 25, color: textColorWhite);
const cardSubTitleStyle =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: textColorWhite);
const descriptionTextStyle =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: textColorWhite);
