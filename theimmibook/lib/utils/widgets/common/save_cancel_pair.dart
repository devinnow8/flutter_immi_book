import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/custom_icon_button.dart';
import 'package:theimmibook/utils/widgets/customButton/customButton.dart';

class SaveAndCancelButtonPair extends StatelessWidget {
  final dynamic onSave;
  final dynamic onCancel;
  const SaveAndCancelButtonPair(
      {super.key, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.center,
      direction: isMobile(context) ? Axis.vertical : Axis.horizontal,
      children: [
        CustomIconButton(
            borderColor: bodyColorBlue,
            padding: EdgeInsets.symmetric(
                horizontal: 25 * widthScaleF2F(context: context),
                vertical: 13 * widthScaleF2F(context: context)),
            bgColor: bodyColorBlue,
            fgColor: textColorWhite,
            onPressed: onSave,
            iconData: Icons.bookmark_border_outlined,
            text: 'Save'),
        SizedBox(
          width: 15 * textScaleF2F(context: context),
        ),
        CustomButton(
            customfontSize: 20,
            customFontWeight: FontWeight.w800,
            smallButton: true,
            highlightColor: bodyColorBlue,
            text: 'Cancel',
            bgColor: Colors.white,
            highlightBgColor: bodyColorBlue,
            highlightTextColor: textColorWhite,
            textColor: bodyColorBlue,
            onPressed: onCancel),
      ],
    );
  }
}
