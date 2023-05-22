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
        width: getMaxNetWidth(context),
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
                          margin: EdgeInsets.symmetric(
                              vertical: max(
                                  60 * widthScaleF2F(context: context), 20)),
                          child: const MyAppBar()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (getScreenWidth(context: context) > mobileWidth)
                            divider(context),
                          SizedBox(
                            height: 160 * widthScaleF2F(context: context),
                          ),
                          SizedBox(
                            width: (isMobile(context)
                                ? 1100 * widthScaleF2F(context: context)
                                : 1100 * widthScaleF2F(context: context)),
                            child: Text(
                              'heroTagline'.tr,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textScaleFactor: isMobile(context)
                                  ? textScaleF2F(context: context) * 0.5
                                  : min(
                                      1, textScaleF2F(context: context) * 0.9),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 160 * widthScaleF2F(context: context),
                          ),
                          if (getScreenWidth(context: context) > mobileWidth)
                            divider(context),
                          if (getScreenWidth(context: context) <= mobileWidth)
                            Column(
                              children: [
                                SizedBox(
                                  height: 150 * widthScaleF2F(context: context),
                                ),
                                const HeaderSearchBox(),
                              ],
                            ),
                          SizedBox(
                            height:
                                getScreenWidth(context: context) <= mobileWidth
                                    ? 350 * widthScaleF2F(context: context)
                                    : 160,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:
                      getScreenWidth(context: context) <= mobileWidth ? 0 : 90,
                ),
                if (getScreenWidth(context: context) < 1300 &&
                    !isMobile(context))
                  const SizedBox(
                    height: 90,
                  )
              ],
            ),
            if (getScreenWidth(context: context) > mobileWidth)
              const HeaderSearchBox()
          ],
        ));
  }
}
