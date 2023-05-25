import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class CustomButton extends StatelessWidget {
  final Color highlightColor;
  final Color highlightBgColor;
  final Color bgColor;
  final Color textColor;
  final Color highlightTextColor;
  final dynamic onPressed;
  final bool smallButton;
  final String text;
  final double customfontSize;
  final FontWeight customFontWeight;
  CustomButton(
      {super.key,
      this.smallButton = false,
      required this.highlightColor,
      required this.text,
      required this.bgColor,
      required this.highlightBgColor,
      required this.highlightTextColor,
      required this.textColor,
      this.customFontWeight = FontWeight.w700,
      this.customfontSize = 1,

      required this.onPressed});

  // ignore: prefer_final_fields
  var _hover = false.obs;

  @override
  Widget build(BuildContext context) {
    double textsize = smallButton ? 14 : 22;
    if (customfontSize != 1) {
      textsize = customfontSize;
    }
    return Obx(
      () => MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        onEnter: (_) {
          _hover.value = true;
        },
        onExit: (_) {
          _hover.value = false;
        },
        child: GestureDetector(
          onTap: onPressed,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      8 * widthScaleF2F(context: context)),
                  color: (_hover.value) ? highlightBgColor : bgColor,
                  border: Border.all(
                      color: highlightColor,
                      width: smallButton
                          ? 1 * widthScaleF2F(context: context)
                          : 2 * widthScaleF2F(context: context))),
              padding: EdgeInsets.symmetric(
                  vertical: _hover.value
                      ? (textsize * widthScaleF2F(context: context)) * .75
                      : textsize * widthScaleF2F(context: context) * .75,
                  horizontal: (smallButton ? 25 : 60) *
                      widthScaleF2F(context: context)),
              child: Text(
                text,
                textScaleFactor: textScaleF2F(context: context),
                style: TextStyle(
                    
                    letterSpacing: smallButton ? 1.5 : 1,
                    color: _hover.value ? highlightTextColor : textColor,
                    fontWeight: customFontWeight,
                    fontSize: _hover.value ? textsize + .1 : textsize),
              )),
        ),
      ),
    );
  }
}
