import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/screens/home_screen/home_screen.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/app_bar/appbar.dart';
import 'package:theimmibook/utils/widgets/header_search_box/header_search_box.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: getScreenWidth(context: context),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // height: getScreenHeight(context: context) + 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('hero.png'),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(imageMaskColor, BlendMode.darken),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 60),
                          child: const MyAppBar()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          divider(context),
                          const SizedBox(
                            height: 160,
                          ),
                          SizedBox(
                            width: 1100 * textScaleF2F(context: context),
                            child: Text(
                              'heroTagline'.tr,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textScaleFactor: (textScaleF2F(context: context)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 160,
                          ),
                          divider(context),
                          const SizedBox(
                            height: 160,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 90,
                )
              ],
            ),
            const HeaderSearchBox()
          ],
        ));
  }
}
