import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double designScreenWidth = 375; //figma design width
double designScreenHeight = 812; //figma design height

double getScreenHeight({required context}) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth({required context}) {
  return MediaQuery.of(context).size.width;
}

double widthFigma2Flutter({required double width, required context}) {
  if (Platform.isIOS) {
    return ((getScreenWidth(context: context) / designScreenWidth) * width);
  }
  return ((getScreenWidth(context: context) / designScreenWidth) * width);
}

double heightFigma2Flutter({required double height, required context}) {
  if (Platform.isIOS) {
    return ((getScreenHeight(context: context) / designScreenHeight) * height);
  }
  return ((getScreenHeight(context: context) / designScreenHeight) * height);
}

double textSizeF2F({required double tSize, required context}) {
  return ((getScreenHeight(context: context) *
              getScreenWidth(context: context) /
              (designScreenWidth * designScreenHeight)) *
          tSize +
      4);
}

double textScaleF2F({required context}) {
  if (Platform.isIOS) {
    double scaleFactor =
        (getScreenHeight(context: context) / (designScreenHeight));
    if (scaleFactor < 0.9) scaleFactor = scaleFactor * 1.2;
    return (scaleFactor);
  }

  return ((getScreenHeight(context: context) / (designScreenHeight)));
}

Widget getRichText(
    {required String text,
    required TextStyle textStyle,
    required TextStyle linkStyle,
    required context,
    required alignment}) {
  List<TextSpan> texts = [];

  List<String> strings = text.split('<-link->');

  strings.forEach((element) {
    if (element.contains('<-url->')) {
      dynamic tmp = element.split('<-url->');
      texts.add(TextSpan(
          text: tmp[0],
          style: linkStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              var url = Uri.https(tmp[1]);
              launchUrl(url);
            }));
    } else {
      texts.add(TextSpan(text: element, style: textStyle));
    }
  });

  return RichText(
      textAlign: alignment,
      textScaleFactor: textScaleF2F(context: context),
      text: TextSpan(children: texts));
}

Color lightenColour(Color color, [double amount = 0.49]) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return hslLight.toColor();
}

Future showErrorDialog({required String errorMessage, required context}) async {
  await showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            content: Text(errorMessage),
          ));
}
