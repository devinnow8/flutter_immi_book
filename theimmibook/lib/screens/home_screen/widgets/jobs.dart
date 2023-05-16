import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
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
        return Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: smallLargeScreen
                      ? desktopSubSectionWidth * 0.75
                      : desktopSubSectionWidth),
                          
                child: getHeadingAndOptions(
                  context: context,
                  title: 'jobsTitle'.tr,
                  options: Text(
                    'viewMore'.tr,
                    style: sectionHeadingOptionsStyle,
                  ),
                )
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: mediumLargeScreen
                            ? desktopSubSectionWidth * .75
                            : (smallLargeScreen
                                ? constraints.maxWidth * 0.7
                                : desktopSubSectionWidth)),
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 30,
                      children: [...jobCardsData.map((e) => jobCard())],
                    ),
                  ),
                ]),
              ),
            )
          ],
        );
      },
    );
  }
}


Widget jobCard() {
  String title = jobCardsData[0]['title'];
  String subTitle = jobCardsData[0]['subTitle'];
  String description = jobCardsData[0]['description'];
  String imageUrl = jobCardsData[0]['imageUrl'];
var scale = 1.0.obs;

  return LayoutBuilder(
    builder: (buildContext, constraints) =>
        StatefulBuilder(builder: (context, setState) {
      log('----->>>>${constraints.maxWidth}');
      return MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        onEnter: (_) {
          setState(
            () {
              log('expanding');
              scale.value = 1.05;
            },
          );
        },
        onExit: (_) {
          setState(
            () {
              scale.value = 1.0;
            },
          );
        },
        child: Obx(
          () => AnimatedScale(
            scale: scale.value,
            duration: const Duration(milliseconds: 350),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    scale.value == 1
                        ? const BoxShadow()
                        : const BoxShadow(
                            color: accentColor, spreadRadius: 2, blurRadius: 15)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width:
                      constraints.maxWidth < 980 && constraints.maxWidth > 630
                          ? 300
                          : 629,
                  height:
                      constraints.maxWidth < 980 && constraints.maxWidth > 630
                          ? 629
                          : 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 19, 19, 1),
                    borderRadius: BorderRadius.circular(10),
                     
                  ),
                  child: Flex(
                    direction:
                        constraints.maxWidth < 980 && constraints.maxWidth > 630
                            ? Axis.vertical
                            : Axis.horizontal,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Image.network(
                          imageUrl,
                          height: constraints.maxWidth < 980 &&
                                  constraints.maxWidth > 630
                              ? 319
                              : double.maxFinite,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        width: constraints.maxWidth < 980 &&
                                constraints.maxWidth > 630
                            ? double.maxFinite
                            : 319,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 37, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(fontSize: 25),
                            ),
                            Text(subTitle,
                                style: const TextStyle(
                                    fontSize: 20, color: accentColor)),
                            Text(description,
                                style: const TextStyle(fontSize: 16))
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        
        
      );
    }),
  );
}

List jobCardsData = [
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://i.insider.com/5f5f9dbbe6ff30001d4e8a39?width=1000&format=jpeg&auto=webp'
  },
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://i.insider.com/5f5f9dbbe6ff30001d4e8a39?width=1000&format=jpeg&auto=webp'
  },
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://i.insider.com/5f5f9dbbe6ff30001d4e8a39?width=1000&format=jpeg&auto=webp'
  },
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://i.insider.com/5f5f9dbbe6ff30001d4e8a39?width=1000&format=jpeg&auto=webp'
  }
];
