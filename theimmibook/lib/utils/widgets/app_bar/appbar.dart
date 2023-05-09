import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';

PreferredSizeWidget getAppBar(context, int mode) {
  //mode : 0 largeScreendesktop, 1 desktop, 2 tab,3 mobile

  double _maxWidth = 0;
  _maxWidth = mode == 0
      ? 1920 - designHorizontalPadding * 2
      : (mode == 1 ? 1200 : (mode == 2 ? 700 : 576));

  if (GetPlatform.isAndroid || GetPlatform.isIOS) {
    return AppBar();
  } else {
    return AppBar(
      toolbarHeight: 80,
      leadingWidth: 0,

      title: Container(
        constraints: BoxConstraints(
          maxWidth: (_maxWidth),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'immibookTitle'.tr,
                    style: Theme.of(context).textTheme.displayLarge,
                    textScaleFactor: 1,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ...menuItems.map(
                  (e) => Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                    child: Text(
                      e,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                )
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

      actions: const [],
    );
  }
}

List menuItems = [
  'home'.tr,
  'about'.tr,
  'services'.tr,
  'jobs'.tr,
  'accomodations'.tr,
  'events'.tr,
  'register'.tr
];
