import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class HeaderSearchBox extends StatefulWidget {
  final List searchMenuItems;
  const HeaderSearchBox({super.key, this.searchMenuItems = const []});

  @override
  State<HeaderSearchBox> createState() => _HeaderSearchBoxState();
}

class _HeaderSearchBoxState extends State<HeaderSearchBox> {
  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      padding: getScreenWidth(context: context) > mobileWidth
          ? EdgeInsets.symmetric(
              vertical: 56, horizontal: 100 * widthScaleF2F(context: context))
          : EdgeInsets.zero,
      width: (isMobile(context)
          ? 1100 * widthScaleF2F(context: context)
          : 1100 * widthScaleF2F(context: context)),
      decoration: BoxDecoration(
        gradient: getScreenWidth(context: context) > mobileWidth
            ? const LinearGradient(
                colors: [gradientPrimaryColor, gradientSecondaryColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)
            : null,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: getScreenWidth(context: context),
              maxHeight: isMobile(context)
                  ? max(300 * widthScaleF2F(context: context), 80)
                  : 150,
            ),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              direction: getScreenWidth(context: context) < 1300
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    height: isMobile(context)
                        ? 45 * widthScaleF2F(context: context)
                        : 55,
                    constraints: const BoxConstraints(minWidth: 350),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 255, 255),
                 
                    ),
                    child: Container(),
                  ),
                ),
                SizedBox(
                  width: 54,
                  height: 60 * widthScaleF2F(context: context),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    height: 55,
                    constraints: const BoxConstraints(minWidth: 350),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 255, 255),
                 
                    ),
                    child: Container(),
                  ),
                )
              ],
            ),
          ),
          if (widget.searchMenuItems.isNotEmpty)
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 30,
                runSpacing: 20,
                children: [
                  ...widget.searchMenuItems.map(
                    (e) => Container(
                      alignment: Alignment.center,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
