import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/screens/home_screen/widgets/Faq.dart';
import 'package:theimmibook/screens/home_screen/widgets/about_us.dart.dart';
import 'package:theimmibook/screens/home_screen/widgets/accomodations.dart';
import 'package:theimmibook/screens/home_screen/widgets/events.dart';
import 'package:theimmibook/screens/home_screen/widgets/jobs.dart';
import 'package:theimmibook/screens/home_screen/widgets/posts.dart';
import 'package:theimmibook/screens/home_screen/widgets/register.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/app_bar/appbar.dart';

import 'widgets/footer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    //double maxWidth =
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollbarTheme(
        data: ScrollbarThemeData(
          
            thumbColor:
                MaterialStateColor.resolveWith((states) => Colors.grey)),
        child: Scrollbar(
          
          trackVisibility: true,
          thickness: 10,
          
          hoverThickness: 10,
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, scrollbarThickness, 0),
              child: Column(
                children: [
                  SizedBox(
                      width: getScreenWidth(context: context),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            'hero.png',
                            height: min(
                                getScreenHeight(context: context) + 100, 1000),
                            fit: BoxFit.cover,
                            width: getScreenWidth(context: context),
                          ),
                          Container(
                            width: getScreenWidth(context: context),
                            height: min(
                                getScreenHeight(context: context) + 100, 1000),
                            color: const Color.fromRGBO(0, 0, 0, .74),
                          ),
                          Column(
                            children: [
                              Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 60),
                                  child: const MyAppBar()),
                              SizedBox(
                                height: min(
                                    450 *
                                        max(textScaleF2F(context: context),
                                            0.8),
                                    500),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    divider(context),
                                    SizedBox(
                                      width:
                                          1100 * textScaleF2F(context: context),
                                      child: Text(
                                        'heroTagline'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        textScaleFactor:
                                           max(
                                            textScaleF2F(context: context),
                                            0.45),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    divider(context),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: max(
                                    110, 110 * textScaleF2F(context: context)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 56,
                                    horizontal:
                                        100 * textScaleF2F(context: context)),
                                width: getSubsectionWidth(context),
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrPqV53Ztw855ECIqr_bKBwiKg9oz2-xoWIGPt8bS4Bg&usqp=CAU&ec=48600112',
                                      ),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Color.fromRGBO(0, 0, 0, 0.7),
                                          BlendMode.darken),
                                    ),
                                    borderRadius: BorderRadius.circular(26),
                                    color: const Color.fromRGBO(0, 0, 0, 0.74)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            getScreenWidth(context: context),
                                        maxHeight:
                                            getScreenWidth(context: context) <
                                                    850
                                                ? 100
                                                : 50,
                                      ),
                                      child: Flex(
                                        direction:
                                            getScreenWidth(context: context) <
                                                    850
                                                ? Axis.vertical
                                                : Axis.horizontal,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                  minWidth: 350),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white,
                                              ),
                                              child: const Text('data'),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 54,
                                            height: 20,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                  minWidth: 350),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white,
                                              ),
                                              child: const Text('data'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      spacing: 30,
                                      runSpacing: 20,
                                      children: [
                                        ...searchmenuItems.map(
                                          (e) => Container(
                                            alignment: Alignment.center,
                                            width: 150,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 15),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.white),
                                            ),
                                            child: Text(
                                              e,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 160,
                  ),
                  const Posts(),
                  const SizedBox(
                    height: 100,
                  ),
                  const Events(),
                  const SizedBox(
                    height: 100,
                  ),
                  const Jobs(),
                  const SizedBox(
                    height: 100,
                  ),
                  const Register(),
                  const SizedBox(
                    height: 100,
                  ),
                  const Accomodations(),
                  const SizedBox(
                    height: 100,
                  ),
                  const AboutUs(),
                  const SizedBox(
                    height: 100,
                  ),
                  const Faq(),
                  const Footer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


List searchmenuItems = [
  'All categories',
  'Events',
  'Jobs',
  'Accomodations',
  'Advertisements',
  'Services',
];


List dummyCards = [
  'This is title',
  'This is title',
  'This is title',
  'This is title',
  'This is title',
  'This is title',
  'This is title'
];

Widget sectionCard(double maxWidth) {
  double width = maxWidth;
  return StatefulBuilder(builder: (context, setState) {
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      onEnter: (_) {
        width = width * 2 + 20;
        setState(() {});
      },
      onExit: (_) {
        width = (width - 20) / 2;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: width,
        height: 290,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white38),
      ),
    );
  });
}


Widget divider(context) {
  return Row(
    children: [
      SizedBox(
        width: min(100, 100 * textScaleF2F(context: context)),
      ),
      const Expanded(
        child: Divider(
          height: 4,
          color: Color.fromARGB(128, 255, 255, 255),
        ),
      ),
      SizedBox(
        width: min(100, 100 * textScaleF2F(context: context)),
      ),
    ],
  );
}
