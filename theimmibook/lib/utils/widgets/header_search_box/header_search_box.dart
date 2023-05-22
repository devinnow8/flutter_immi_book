import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class HeaderSearchBox extends StatefulWidget {
  final List searchMenuItems;
  const HeaderSearchBox({
    super.key,
    this.searchMenuItems = const [],
  });

  @override
  State<HeaderSearchBox> createState() => _HeaderSearchBoxState();
}

class _HeaderSearchBoxState extends State<HeaderSearchBox> {
  @override
  Widget build(context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: getScreenWidth(context: context) <= 1300 &&
                  getScreenWidth(context: context) > mobileWidth
              ? 560
              : getSubsectionWidth(context)),
      alignment: Alignment.center,
      padding: getScreenWidth(context: context) > mobileWidth
          ? EdgeInsets.symmetric(
              vertical: 56, horizontal: 100 * widthScaleF2F(context: context))
          : EdgeInsets.zero,
      width: (isMobile(context)
          ? 1100 * widthScaleF2F(context: context)
          : widget.searchMenuItems.isEmpty
              ? (1400 * widthScaleF2F(context: context))
              : getSubsectionWidth(context)),
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
                    constraints: BoxConstraints(
                        minWidth: 450,
                        maxWidth: getScreenWidth(context: context) <= 1300 &&
                                getScreenWidth(context: context) > mobileWidth
                            ? 560
                            : 700),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Theme(
                      data: ThemeData.light(),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: DropdownMenu(
                          inputDecorationTheme: const InputDecorationTheme(
                              isDense: false,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          width: getSubsectionWidth(context) / 2.6,
                          leadingIcon: const Icon(Icons.location_on_rounded),
                          initialSelection: 'Australia',
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 'red', label: 'Sydney'),
                            DropdownMenuEntry(value: 'red', label: 'CA'),
                            DropdownMenuEntry(value: 'red', label: 'LE'),
                            DropdownMenuEntry(value: 'red', label: 'RA')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 54,
                  height: 60 * widthScaleF2F(context: context),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                    ),
                    height: 55,
                    constraints: BoxConstraints(
                        maxWidth: getScreenWidth(context: context) <= 1300 &&
                                getScreenWidth(context: context) > mobileWidth
                            ? 560
                            : 700),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: TextField(
                        cursorHeight:
                            max(35 * textScaleF2F(context: context), 20),
                        style: const TextStyle(
                            color: textColorBlack, fontSize: 22),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            isDense: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none)),
                  ),
                )
              ],
            ),
          ),
          if (widget.searchMenuItems.isNotEmpty)
            Container(
              constraints: const BoxConstraints(
                  minWidth: double.maxFinite, maxHeight: 50),
              margin: EdgeInsets.fromLTRB(
                  0, 40 * widthScaleF2F(context: context), 0, 0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
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
              ),
            ),
        ],
      ),
    );
  }
}
