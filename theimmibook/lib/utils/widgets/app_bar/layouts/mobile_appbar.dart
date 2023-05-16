import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appbarHeight),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 30 * widthScaleF2F(context: context) * 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'The Immi Book',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              textScaleFactor: max(textScaleF2F(context: context) * 4, 0.8),
            ),
            SvgPicture.asset(
              'burgerMenuIcon.svg',
              height: 18 * widthScaleF2F(context: context) * 4.2,
            ),
          ],
        ),
      ),
    );
  }
}
