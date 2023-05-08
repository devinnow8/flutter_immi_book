import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getText(String text, {style, textAlign, textScaleFactor}) {
  return GetPlatform.isWeb
      ? SelectionArea(
          child: Text(
            text,
            textScaleFactor: textScaleFactor,
            textAlign: textAlign,
            style: style,
          ),
        )
      : Text(
          text,
          textScaleFactor: textScaleFactor,
          textAlign: textAlign,
          style: style,
        );
}
