import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/nav_link.dart';

import '../widgets/menu.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appbarHeight * 2),
      child: Column(
        children: [
          Text(
            'The Immi Book',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
            textScaleFactor: max(textScaleF2F(context: context) * 4, 0.8),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight:
                appbarHeight * 6.5 * max(textScaleF2F(context: context), 0.25),
            leadingWidth: 0,
            automaticallyImplyLeading: false,
            title: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: max(
                        (getScreenWidth(context: context) -
                                getMaxWidth(context)) /
                            2,
                        40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavLink(
                        textScaleFactor:
                            max(textScaleF2F(context: context) * 2.5, 0.7),
                        text: navMenuItems[0],
                        onClick: () {
                          // log('clicked');
                          //print('Clicked');
                        },
                        style: Theme.of(context).textTheme.displayLarge),
                    NavLink(
                        textScaleFactor:
                            max(textScaleF2F(context: context) * 2.5, 0.7),
                        text: navMenuItems[2],
                        onClick: () {
                          // log('clicked');
                          //print('Clicked');
                        },
                        style: Theme.of(context).textTheme.displayLarge),
                    NavLink(
                        textScaleFactor:
                            max(textScaleF2F(context: context) * 2.5, 0.7),
                        text: navMenuItems[3],
                        onClick: () {
                          // log('clicked');
                          //print('Clicked');
                        },
                        style: Theme.of(context).textTheme.displayLarge),
                    NavLink(
                        textScaleFactor:
                            max(textScaleF2F(context: context) * 2.5, 0.7),
                        text: navMenuItems.last,
                        onClick: () {
                          // log('Clicked');
                        },
                        style: Theme.of(context).textTheme.displayLarge),
                  ],
                )),
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
          ),
        ],
      ),
    );
  }
}
