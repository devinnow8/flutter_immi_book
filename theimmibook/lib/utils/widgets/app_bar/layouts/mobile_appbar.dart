import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/nav_link.dart';

import '../widgets/menu.dart';

class MobileAppBar extends StatefulWidget {
  const MobileAppBar({super.key});

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();
}

class _MobileAppBarState extends State<MobileAppBar> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appbarHeight),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getHorizontalPadding(context)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'The Immi Book',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 25),
                  textScaleFactor: (textScaleF2F(context: context) * 1.5),
                ),
                InkWell(
                  onTap: () {
                    expanded = !expanded;
                    setState(() {});
                  },
                  child: SvgPicture.asset(
                    'burgerMenuIcon.svg',
                    height: 18 * widthScaleF2F(context: context) * 4.2,
                  ),
                ),
              ],
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(sizeFactor: animation, child: child);
              },
              child: (expanded)
                  ?
                  //color: Colors.black,
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(),
                        ...navMenuItems.sublist(0, navMenuItems.length - 1).map(
                              (e) => Container(
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    15 * textScaleF2F(context: context),
                                    0,
                                    15 * textScaleF2F(context: context)),
                                child: NavLink(
                                    textScaleFactor:
                                        textScaleF2F(context: context),
                                    text: e,
                                    onClick: () {
                                      GoRouter.of(context).pushNamed(
                                          e.toString().toLowerCase());
                                    },
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .merge(const TextStyle(fontSize: 30))),
                              ),
                            ),
                        SizedBox(
                          height: 15 * textScaleF2F(context: context),
                        ),
                        NavLink(
                            textScaleFactor: textScaleF2F(context: context),
                            text: navMenuItems.last,
                            onClick: () {
                              //  dev.log('clicked');
                              GoRouter.of(context).pushNamed(
                                  navMenuItems.last.toString().toLowerCase());
                              // return context.go('/jobs');
                              // dev.log('clicked');
                            },
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .merge(const TextStyle(fontSize: 30)))
                      ],
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
