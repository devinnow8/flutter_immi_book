import 'dart:math';
import 'package:flutter/material.dart';
import 'package:theimmibook/screens/home_screen/widgets/Faq.dart';
import 'package:theimmibook/screens/home_screen/widgets/about_us.dart.dart';
import 'package:theimmibook/screens/home_screen/widgets/accomodations.dart';
import 'package:theimmibook/screens/home_screen/widgets/events.dart';
import 'package:theimmibook/screens/home_screen/widgets/header.dart';
import 'package:theimmibook/screens/home_screen/widgets/jobs.dart';
import 'package:theimmibook/screens/home_screen/widgets/posts.dart';
import 'package:theimmibook/screens/home_screen/widgets/register.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

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
          
          trackVisibility:
              getScreenWidth(context: context) < mobileWidth ? false : true,
          thickness: getScreenWidth(context: context) < mobileWidth ? 2 : 10,
          
          hoverThickness:
              getScreenWidth(context: context) < mobileWidth ? 3 : 10,
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  0,
                  0,
                  getScreenWidth(context: context) < mobileWidth
                      ? 0
                      : scrollbarThickness,
                  0),
              child: Column(
                children: [
                  const Header(),
                  SizedBox(
                    height: isMobile(context)
                        ? 250 * widthScaleF2F(context: context)
                        : 160,
                  ),

                  const Posts(),
                  SizedBox(
                    height: isMobile(context)
                        ? 250 * widthScaleF2F(context: context)
                        : 140,
                  ),
                  const Events(),
                  SizedBox(
                    height: isMobile(context)
                        ? 250 * widthScaleF2F(context: context)
                        : 140,
                  ),
                  const Jobs(),
                  const SizedBox(
                    height: 100,
                  ),
                  const Register(),

                  const Accomodations(),
                  SizedBox(
                    height: isMobile(context)
                        ? 200 * widthScaleF2F(context: context)
                        : 100,
                  ),
                  const AboutUs(),
                  SizedBox(
                    height: isMobile(context)
                        ? 200 * widthScaleF2F(context: context)
                        : 100,
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
  return ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 1920),
    child: Row(
      children: [
        SizedBox(
          width: min(100, 100 * textScaleF2F(context: context)),
        ),
        const Expanded(
          child: Divider(
            height: 4,
            thickness: 3,
            color: Color.fromARGB(128, 255, 255, 255),
          ),
        ),
        SizedBox(
          width: min(100, 100 * textScaleF2F(context: context)),
        ),
      ],
    ),
  );
}
