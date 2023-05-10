import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/widgets/common/nav_link.dart';

PreferredSizeWidget getAppBar(context, double screenWidth, scaffoldKey) {
  //mode : 0 largeScreendesktop, 1 desktop, 2 tab,3 mobile

  print(screenWidth);

  double maxWidth = 1920 - designHorizontalPadding * 2;
  if (screenWidth <= 1200) {
    maxWidth = 1920 - designHorizontalPadding * 2;
  }
  print(maxWidth);
  if (!kIsWeb) {
    return AppBar(
      backgroundColor: Colors.blue,
    );
  } else {
    return AppBar(
     
      toolbarHeight: appbarHeight,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      title: Container(
        constraints: BoxConstraints(
          maxWidth: (maxWidth),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
              
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: screenWidth > 320
                            ? 280
                            : (screenWidth > 250 ? 140 : 80)),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'immibookTitle'.tr,
                        style: Theme.of(context).textTheme.displayLarge,
                        textScaleFactor: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            (screenWidth < 786)
                ? const SizedBox()
                : screenWidth < 1200
                    ? Row(
                        children: [
                          NavLink(
                              text: 'home'.tr,
                              onClick: () {},
                              style: Theme.of(context).textTheme.displayMedium),
                          const SizedBox(
                            width: 40,
                          ),
                          NavLink(
                              text: 'services'.tr,
                              onClick: () {},
                              style: Theme.of(context).textTheme.displayMedium),
                          const SizedBox(
                            width: 40,
                          ),
                          NavLink(
                              text: 'events'.tr,
                              onClick: () {},
                              style: Theme.of(context).textTheme.displayMedium),
                          const SizedBox(
                            width: 40,
                          ),
                          NavLink(
                              text: 'register'.tr,
                              onClick: () {},
                              style: Theme.of(context).textTheme.displayMedium)
                        ],
                      )
                    :
            Row(
              children: [
                          ...navMenuItems.map(
                  (e) => Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                              child: NavLink(
                                  text: e,
                                  onClick: () {
                                    print('Clicked');
                                  },
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                            ),
                          ),
                          NavLink(
                              text: 'register'.tr,
                              onClick: () {},
                              style: Theme.of(context).textTheme.displayMedium)
              ],
            )
          ],
        ),
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.

      actions: [
        (screenWidth < 786)
            ? SizedBox(
                width: 70,
                child: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 40,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

List navMenuItems = [
  'home'.tr,
  'about'.tr,
  'services'.tr,
  'jobs'.tr,
  'accomodations'.tr,
  'events'.tr,
 
];
