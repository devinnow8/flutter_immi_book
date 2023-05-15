import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                      alignment: WrapAlignment.center,
                      spacing: 30,
                      runSpacing: 30,
                      children: [
                        Container(
                          color: Colors.black,
                          width: 550,
                          height: 600,
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: 546, maxHeight: 600),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'aboutTitle'.tr,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 38,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                'aboutSubTitle'.tr,
                                style: const TextStyle(
                                  color: accentColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'aboutDescription'.tr,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        )
                      ],
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
