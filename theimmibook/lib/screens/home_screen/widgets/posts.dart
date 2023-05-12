import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final CarouselController _carousalController = CarouselController();
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
                      : desktopSubSectionWidth - 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'postsTitle'.tr,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 60),
                  ),
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: accentColor,
                    child: Icon(
                      Icons.add,
                      size: 40,
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
                    mainAxisAlignment: mediumLargeScreen || smallLargeScreen
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          focusColor: Colors.transparent,
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                          splashColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            _carousalController.previousPage(
                                duration: const Duration(milliseconds: 700));
                          },
                          child: SvgPicture.asset('navArrow.svg')),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: mediumLargeScreen
                                ? desktopSubSectionWidth * .75
                                : (smallLargeScreen
                                    ? constraints.maxWidth * 0.7
                                    : desktopSubSectionWidth)),
                        child: CarouselSlider(
                            items: [
                              ...postCardsData.map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: postCard()))
                            ],
                            carouselController: _carousalController,
                            options: CarouselOptions(
                              height: 509,
                              aspectRatio: 0.79,
                              viewportFraction: smallLargeScreen ? 0.5 : 0.33,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: false,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1200),
                              autoPlayCurve: Curves.linear,
                              enlargeCenterPage: false,
                              padEnds: false,
                              enlargeFactor: 0,
                              onPageChanged: (p1, p2) {},
                              scrollDirection: Axis.horizontal,
                            )),
                      ),
                      InkWell(
                        focusColor: Colors.transparent,
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                        splashColor: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          _carousalController.nextPage(
                              duration: const Duration(milliseconds: 700));
                        },
                        child: RotatedBox(
                            quarterTurns: 2,
                            child: SvgPicture.asset('navArrow.svg')),
                      )
                    ]),
              ),
            )
          ],
        );
      },
    );
  }
}

Widget postCard() {
  String title = postCardsData[0]['title'];
  String subTitle = postCardsData[0]['subTitle'];
  String description = postCardsData[0]['description'];
  String imageUrl = postCardsData[0]['imageUrl'];
  return StatefulBuilder(builder: (context, setState) {
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          width: double.maxFinite,
          height: 509,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white38),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                imageUrl,
                width: double.maxFinite,
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                  child: Container(
                color: const Color.fromARGB(255, 0, 0, 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 37, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(subTitle,
                        style:
                            const TextStyle(fontSize: 20, color: accentColor)),
                    Text(description, style: const TextStyle(fontSize: 16))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  });
}

List postCardsData = [
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAAcXlIOIwRV8sWxU5swpc992QP742m4tUns1vXrsulw&usqp=CAU&ec=48600112'
  },
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAAcXlIOIwRV8sWxU5swpc992QP742m4tUns1vXrsulw&usqp=CAU&ec=48600112'
  },
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAAcXlIOIwRV8sWxU5swpc992QP742m4tUns1vXrsulw&usqp=CAU&ec=48600112'
  },
  {
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'description':
        'It is a long established fact that a reader will be distracted by the readable content.',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAAcXlIOIwRV8sWxU5swpc992QP742m4tUns1vXrsulw&usqp=CAU&ec=48600112'
  }
];
