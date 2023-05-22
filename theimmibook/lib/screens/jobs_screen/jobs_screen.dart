import 'dart:math';
import 'package:flutter/material.dart';
import 'package:theimmibook/screens/home_screen/widgets/jobs.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/header.dart';
import '../home_screen/widgets/footer.dart';

class MyJobsPage extends StatefulWidget {
  const MyJobsPage({super.key});

  @override
  State<MyJobsPage> createState() => _MyJobsPageState();
}

class _MyJobsPageState extends State<MyJobsPage> {
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
                  Header(),
                  SizedBox(
                    height: isMobile(context)
                        ? 250 * widthScaleF2F(context: context)
                        : 160,
                  ),
                  const Jobs(),
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
