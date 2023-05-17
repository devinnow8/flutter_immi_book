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
          : EdgeInsets.fromLTRB(getHorizontalPadding(context), 0,
              getHorizontalPadding(context), 0),
      width: getSubsectionWidth(context) - 160,
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
              maxHeight: 150,
            ),
            child: Flex(
              direction: getScreenWidth(context: context) < 1000
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
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
                    child: DropdownMenu(
                        width: 420,
                        menuStyle: MenuStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => bodyBgSecondaryColor)),
                        inputDecorationTheme: const InputDecorationTheme(
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                        trailingIcon: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 22,
                          color: bodyColorBlue,
                        ),
                        textStyle:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        leadingIcon: SvgPicture.asset(
                          'locationPin.svg',
                          height: 10,
                          fit: BoxFit.scaleDown,
                        ),
                        enableSearch: true,
                        enableFilter: true,
                        enabled: true,
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                            value: 'ss',
                            label: 'l1',
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.resolveWith(
                                (states) => const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          DropdownMenuEntry(
                            value: 'ssd',
                            label: 'l1',
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.resolveWith(
                                (states) => const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          DropdownMenuEntry(
                            value: 'ssd',
                            label: 'l1',
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.resolveWith(
                                (states) => const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          DropdownMenuEntry(
                            value: 'ssd',
                            label: 'l1',
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.resolveWith(
                                (states) => const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          DropdownMenuEntry(
                            value: 'ssd',
                            label: 'l1',
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.resolveWith(
                                (states) => const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          DropdownMenuEntry(
                            value: 'ssd',
                            label: 'l1',
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.resolveWith(
                                (states) => const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  width: 54,
                  height: 20,
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
                    child: TextField(
                      style: const TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                          suffixIcon: SvgPicture.asset(
                            'search.svg',
                            height: 10,
                            fit: BoxFit.scaleDown,
                          ),
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: const TextStyle(
                              color: Colors.black54, fontSize: 16),
                          hintText: 'What are you looking for?'),
                    ),
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
