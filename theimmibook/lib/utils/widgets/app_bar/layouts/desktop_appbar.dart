import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/nav_link.dart';

import '../widgets/menu.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appbarHeight * 2),
      child: Column(
        children: [
          const Text(
            'The Immi Book',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 70),
          ),
          const SizedBox(
            height: 40,
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: appbarHeight - 20,
            leadingWidth: 0,
            automaticallyImplyLeading: false,
            title: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: max(
                        (getScreenWidth(context: context) -
                                getMaxWidth(context)) /
                            2,
                        40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...navMenuItems.sublist(0, navMenuItems.length - 1).map(
                          (e) => Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                            child: NavLink(
                                text: e,
                                onClick: () {
                                  // log('clicked');
                                  //print('Clicked');
                                },
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                          ),
                        ),
                    NavLink(
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
