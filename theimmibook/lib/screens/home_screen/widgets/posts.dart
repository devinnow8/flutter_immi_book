import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final CarouselController _carousalController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: getSubsectionWidth(context)),
          child: getHeadingAndOptions(
            context: context,
            title: 'postsTitle'.tr,
            options: CircleAvatar(
              radius: getScreenWidth(context: context) < 1000 ? 25 : 35,
              backgroundColor: gradientPrimaryColor,
              child: Icon(
                Icons.add,
                size: getScreenWidth(context: context) < 1000 ? 30 : 40,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: getMaxNetWidth(context)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (getScreenWidth(context: context) > 786)
              getNavArrow(
                onTap: () {
                  _carousalController.previousPage(
                      duration: const Duration(milliseconds: 700));
                },
              ),
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: getSubsectionWidth(context) + 30),
              child: CarouselSlider(
                  items: [
                    ...postCardsData.map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: postCard()))
                  ],
                  carouselController: _carousalController,
                  options: CarouselOptions(
                    height: 553,
                    aspectRatio: 0.65,
                    viewportFraction: 0.33,
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
            if (getScreenWidth(context: context) > 786)
              getNavArrow(
                        onTap: () {
                          _carousalController.nextPage(
                              duration: const Duration(milliseconds: 700));
                        },
                  right: true)
          ]),
          
        )
      ],
    );
  }
}

Widget getNavArrow({bool right = false, required onTap}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 60),
    child: InkWell(
      focusColor: Colors.transparent,
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: RotatedBox(
          quarterTurns: right ? 2 : 0,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              const CircleAvatar(
                backgroundColor: bodyBgSecondaryColor,
                radius: 52,
              ),
              SvgPicture.asset(
                'arrowLeft.svg',
                width: 58,
                fit: BoxFit.fitWidth,
              ),
            ],
          )),
    ),
  );
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
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
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: cardTitleStyle,
                      ),
                      Text(subTitle, style: cardSubTitleStyle),
                      Text(description, style: descriptionTextStyle),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.account_circle),
                          const SizedBox(
                            width: 15,
                          ),
                          Text('D. Smith',
                              style: descriptionTextStyle
                                  .merge(const TextStyle(fontSize: 14))),
                        ],
                      )
                    ],
                  ),
                ),
              )
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
