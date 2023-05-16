import 'package:flutter/material.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/widgets/app_bar/layouts/desktop_appbar.dart';
import 'package:theimmibook/utils/widgets/app_bar/layouts/mobile_appbar.dart';
import 'package:theimmibook/utils/widgets/app_bar/layouts/tablet_appbar.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (buildContext, constraints) {
        if (constraints.maxWidth > 1280) {
          return const DesktopAppBar();
        }
      else if (constraints.maxWidth > mobileWidth)
      {
          return const TabletAppBar();
        } else {
          return const MobileAppBar();
        }
      },
    );
  }
}


