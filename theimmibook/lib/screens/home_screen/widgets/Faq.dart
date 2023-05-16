import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/screens/home_screen/home_screen.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:video_player/video_player.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (buildContext, constraints) {
        bool isMobile = constraints.maxWidth <= mobileWidth;
        bool mediumLargeScreen = false;
        bool smallLargeScreen = false;
        if (constraints.maxWidth <= 1360) {
          smallLargeScreen = true;
        } else if (constraints.maxWidth <= 1700) {
          mediumLargeScreen = true;
        }

        log(constraints.maxWidth.toString());
        return Container(
          width: getScreenWidth(context: context),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                gradientPrimaryColor,
                gradientSecondaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: smallLargeScreen
                        ? desktopSubSectionWidth * 0.75
                        : desktopSubSectionWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'faqTitle'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 60),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: smallLargeScreen
                        ? designScreenWidth
                        : constraints.maxWidth - 80),
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: mediumLargeScreen
                                  ? desktopSubSectionWidth * .75
                                  : (smallLargeScreen
                                      ? constraints.maxWidth * 0.7
                                      : desktopSubSectionWidth)),
                          child: Column(
                            children: [
                              ...faqTilesData.map((e) => faqTile()),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'viewMore'.tr,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget faqTile() {
  String question = faqTilesData[0]['question'];
  String answer = faqTilesData[0]['answer'];
  bool expanded = false;

  return StatefulBuilder(builder: (context, setState) {
  
      return MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        child: GestureDetector(
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          behavior: HitTestBehavior.translucent,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    (expanded)
                        ? const Icon(
                            Icons.remove_circle_outline_sharp,
                            color: Colors.white,
                            size: 33,
                          )
                        : const Icon(
                            Icons.add_circle_outline_sharp,
                            color: Colors.white,
                            size: 33,
                          ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Text(
                        question,
                        style: const TextStyle(fontSize: 45),
                      ),
                    )
                  ],
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return SizeTransition(sizeFactor: animation, child: child);
                  },
                  child: (expanded)
                      ? Row(
                          children: [
                            const SizedBox(
                              width: 62,
                            ),
                            ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 1000),
                                child: Expanded(
                                  child: Text(
                                    answer,
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                )),
                          ],
                        )
                      : const SizedBox(),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Divider(
                  height: 3,
                  thickness: 0.7,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ));
  });
}

List faqTilesData = [
  {
    'question': 'Sed in sem et nisl tempus hendrerit vel et ante.',
    'answer':
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using normal distribution of letters, as opposed content making.',
  },
  {
    'question': 'Sed in sem et nisl tempus hendrerit vel et ante.',
    'answer':
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using normal distribution of letters, as opposed content making.',
  },
  {
    'question': 'Sed in sem et nisl tempus hendrerit vel et ante.',
    'answer':
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using normal distribution of letters, as opposed content making.',
  },
];
