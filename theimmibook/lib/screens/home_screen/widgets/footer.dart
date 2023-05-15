import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theimmibook/screens/home_screen/home_screen.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:video_player/video_player.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
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
          color: Color.fromARGB(255, 0, 0, 0),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'immibookTitle'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                            color: accentColor),
                      ),
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
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 600),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SelectableText(
                                      'postsTitle'.tr,
                                    ),
                                    Text('jobs'.tr),
                                    Text('accomodations'.tr),
                                    Text('events'.tr),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 300),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset('twitterIcon.svg'),
                                    SvgPicture.asset('youtubeIcon.svg'),
                                    SvgPicture.asset('tiktokIcon.svg'),
                                    SvgPicture.asset('instagramIcon.svg'),
                                    SvgPicture.asset('mailIcon.svg'),
                                  ],
                                ),
                              )
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
