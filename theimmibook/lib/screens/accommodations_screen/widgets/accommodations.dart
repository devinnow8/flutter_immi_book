import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class Accommodations extends StatefulWidget {
  const Accommodations({super.key});

  @override
  State<Accommodations> createState() => _AccommodationsState();
}

class _AccommodationsState extends State<Accommodations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context: context),
      color: Colors.white,
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
  String description = accomodationCardsData[0]['description'];
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
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'locationPin.svg',
                                      fit: BoxFit.fitHeight,
                                      color: textColorWhite,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        title,
                                        textScaleFactor: isMobile(context)
                                            ? textScaleF2F(context: context) *
                                                0.85
                                            : textScaleF2F(context: context),
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  description,
                                  textScaleFactor:
                                      textScaleF2F(context: context),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: textColorWhite,
                                      fontSize: 20),
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
                                    height:
                                        15 * widthScaleF2F(context: context),
                                  )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: isMobile(context) ? 35 : 60,
                    right: 0,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        SvgPicture.asset(
                          'bookMark.svg',
                          height: isMobile(context)
                              ? 62 * 2.5 * widthScaleF2F(context: context)
                              : 62,
                          fit: BoxFit.fitHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            ),
                            SizedBox(
                              width: isMobile(context)
                                  ? 20 * widthScaleF2F(context: context)
                                  : 20,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: isMobile(context)
                        ? 160 * widthScaleF2F(context: context) * 2.5
                        : 160,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                colorFilter: const ColorFilter.mode(
                                    Color.fromRGBO(0, 0, 0, 0.65),
                                    BlendMode.darken),
                                image: NetworkImage(
                                  imageUrl,
                                ),
                                fit: BoxFit.cover,
                              )),
                          width: isMobile(context)
                              ? 150 * widthScaleF2F(context: context) * 2.5
                              : 150,
                          height: isMobile(context)
                              ? 150 * widthScaleF2F(context: context) * 2.5
                              : 150,
                          child: Text(
                            '+2',
                            style: const TextStyle(color: textColorWhite),
                            textScaleFactor: textScaleF2F(context: context),
                          ),
                        )
                      ],
                    ),
                  )
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
    'title': '1C Roma Terrace, Port Macquarie 2444, NSW',
    'description': '2 room, 1 bathroom, 1 kitchen, 1 Parking',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': '1C Roma Terrace, Port Macquarie 2444, NSW',
    'description': '2 room, 1 bathroom, 1 kitchen, 1 Parking',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': '1C Roma Terrace, Port Macquarie 2444, NSW',
    'description': '2 room, 1 bathroom, 1 kitchen, 1 Parking',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': '1C Roma Terrace, Port Macquarie 2444, NSW',
    'description': '2 room, 1 bathroom, 1 kitchen, 1 Parking',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': '1C Roma Terrace, Port Macquarie 2444, NSW',
    'description': '2 room, 1 bathroom, 1 kitchen, 1 Parking',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': '1C Roma Terrace, Port Macquarie 2444, NSW',
    'description': '2 room, 1 bathroom, 1 kitchen, 1 Parking',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': '1C Roma Terrace, Port Macquarie 2444, NSW',
    'description': '2 room, 1 bathroom, 1 kitchen, 1 Parking',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  },
  {
    'title': '1C Roma Terrace, Port Macquarie 2444, NSW',
    'description': '2 room, 1 bathroom, 1 kitchen, 1 Parking',
    'rent': '400',
    'imageUrl':
        'https://is1-2.housingcdn.com/01c16c28/5b22150c7ca535f7ee5422c26d02aefa/v0/medium/1_bhk_apartment-for-rent-nedumbassery-Aluva-bedroom.jpg'
  }
];
