import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:video_player/video_player.dart';

class Accomodations extends StatefulWidget {
  const Accomodations({super.key});

  @override
  State<Accomodations> createState() => _AccomodationsState();
}

class _AccomodationsState extends State<Accomodations> {
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
          color: bodyBgSecondaryColor,
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
                child: getHeadingAndOptions(
                  context: context,
                  title: 'accomodationsTitle'.tr,
                  options: Text(
                      'viewMore'.tr,
                    style: sectionHeadingOptionsStyle,
                  ),
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
                          child: Wrap(
                            spacing: 30,
                            runSpacing: 30,
                            children: [
                              ...accomodationCardsData
                                  .map((e) => accomodationCard())
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

Widget accomodationCard() {
  String title = accomodationCardsData[0]['title'];
  String rent = accomodationCardsData[0]['rent'];
  String imageUrl = accomodationCardsData[0]['imageUrl'];
  var scale = 1.0.obs;
  VideoPlayerController _vpController =
      VideoPlayerController.network('https://www.fluttercampus.com/video.mp4')
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        });

  return StatefulBuilder(builder: (context, setState) {
    
      return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      onEnter: (_) {
        setState(
          () {
            log('expanding');
            scale.value = 1.05;
            _vpController.play();
          },
        );
      },
      onExit: (_) {
        setState(
          () {
            scale.value = 1.0;
            _vpController.seekTo(Duration.zero);
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
                
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  scale.value == 1
                      ? const BoxShadow(color: Colors.transparent)
                      : const BoxShadow(
                          color: highlightColor,
                          spreadRadius: 0.2,
                          blurRadius: 15)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Stack(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 630,
                        height: 660,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Flex(
                          direction: Axis.vertical,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  imageUrl,
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      title,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 40,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'viewDetails'.tr,
                                      style: const TextStyle(
                                          color: accentColor, fontSize: 24),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        elevation: 5,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          width: 250,
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'A\$ $rent',
                                style: const TextStyle(
                                    color: accentColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                ' / month',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // if (scale.value != 1)
                  //   AnimatedContainer(
                  //     duration: const Duration(milliseconds: 150),
                  //     color: Color.fromARGB(62, 167, 39, 39),
                  //     width: 630,
                  //     height: 660,
                  //     child: VideoPlayer(
                  //       _vpController,
                  //     ),
                  //   )
                ],
              ),
            ),
          ),
        ),
      ),
      );
  });
}

List accomodationCardsData = [
  {
    'title': 'Your personal guide in new country',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': 'Your personal guide in new country',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': 'Your personal guide in new country',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': 'Your personal guide in new country',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  }
];
