import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:video_player/video_player.dart';

class AccommodationsWidget extends StatefulWidget {
  const AccommodationsWidget({super.key});

  @override
  State<AccommodationsWidget> createState() => _AccommodationsWidgetState();
}

class _AccommodationsWidgetState extends State<AccommodationsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context: context),
      color: bodyBgSecondaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: getSubsectionWidth(context)),
              child: getHeadingAndOptions(
                  context: context,
                  title: 'accommodationsTitle'.tr,
                  adjust: true,
                  options: Text(
                    'viewMore'.tr,
                    style: sectionHeadingOptionsStyle,
                    textScaleFactor: textScaleF2F(context: context),
                  )),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: getSubsectionWidth(context)),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 30,
                runSpacing: 30,
                children: [
                  ...accomodationCardsData.map((e) => accomodationCard(context))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}

Widget accomodationCard(mainContext) {
  String title = accomodationCardsData[0]['title'];
  String rent = accomodationCardsData[0]['rent'];
  String imageUrl = accomodationCardsData[0]['imageUrl'];
  var scale = 1.0.obs;
  // VideoPlayerController _vpController =
  //     VideoPlayerController.network('https://www.fluttercampus.com/video.mp4')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       });

  return StatefulBuilder(builder: (context, setState) {
    double width = isMobile(context)
        ? getSubsectionWidth(context) * 1.2 * widthScaleF2F(context: context)
        : 630;
    double height = isMobile(context)
        ? 660 * 2 * 1.2 * widthScaleF2F(context: context)
        : 660;
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      onEnter: (_) {
        setState(
          () {
            log('expanding');
            scale.value = 1.05;
            // _vpController.play();
          },
        );
      },
      onExit: (_) {
        setState(
          () {
            scale.value = 1.0;
            // _vpController.seekTo(Duration.zero);
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
              borderRadius: BorderRadius.circular(isMobile(context)
                  ? 70 * widthScaleF2F(context: context)
                  : 35),
              child: Stack(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                gradientPrimaryColor,
                                gradientSecondaryColor,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Flex(
                          direction: Axis.vertical,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    isMobile(context)
                                        ? 60 * widthScaleF2F(context: context)
                                        : 30),
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
                                      textScaleFactor: isMobile(context)
                                          ? textScaleF2F(context: context) *
                                              0.85
                                          : textScaleF2F(context: context),
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 40,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'viewDetails'.tr,
                                      textScaleFactor:
                                          textScaleF2F(context: context),
                                      style: const TextStyle(
                                          color: textColorWhite, fontSize: 24),
                                    ),
                                    if (isMobile(context))
                                      SizedBox(
                                        height: 15 *
                                            widthScaleF2F(context: context),
                                      )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(isMobile(context)
                            ? 30 * widthScaleF2F(context: context)
                            : 15),
                        elevation: 5,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  isMobile(context)
                                      ? 30 * widthScaleF2F(context: context)
                                      : 15)),
                          width: isMobile(context)
                              ? 250 * 2.2 * widthScaleF2F(context: context)
                              : 250,
                          height: isMobile(context)
                              ? 100 * 2.2 * widthScaleF2F(context: context)
                              : 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'A\$ $rent',
                                textScaleFactor: textScaleF2F(context: context),
                                style: const TextStyle(
                                    color: bodyColorBlue,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                ' / month',
                                textScaleFactor: textScaleF2F(context: context),
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
    'title': 'Modern studio near Filnders Street Railway Station',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': 'Modern studio near Filnders Street Railway Station',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': 'Modern studio near Filnders Street Railway Station',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': 'Modern studio near Filnders Street Railway Station',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  }
];
