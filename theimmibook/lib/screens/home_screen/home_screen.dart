import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/screens/home_screen/widgets/accomodations.dart';
import 'package:theimmibook/screens/home_screen/widgets/events.dart';
import 'package:theimmibook/screens/home_screen/widgets/jobs.dart';
import 'package:theimmibook/screens/home_screen/widgets/posts.dart';
import 'package:theimmibook/screens/home_screen/widgets/register.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/app_bar/appbar.dart';

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
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Column(
                children: [
                  SizedBox(
                      width: getScreenWidth(context: context),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            'hero.png',
                            height: getScreenHeight(context: context) + 100,
                            fit: BoxFit.cover,
                            width: getScreenWidth(context: context),
                          ),
                          Container(
                            width: getScreenWidth(context: context),
                            height: getScreenHeight(context: context) + 100,
                            color: const Color.fromRGBO(0, 0, 0, .74),
                          ),
                          Column(
                            children: [
                              Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 60),
                                  child: const MyAppBar()),
                              SizedBox(
                                height: 500,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    divider(),
                                    SizedBox(
                                      width: 1100,
                                      child: Text(
                                        'heroTagline'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        textScaleFactor:
                                            textScaleF2F(context: context),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    divider(),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 110,
                              ),
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(26),
                                    child: Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrPqV53Ztw855ECIqr_bKBwiKg9oz2-xoWIGPt8bS4Bg&usqp=CAU&ec=48600112',
                                      fit: BoxFit.fill,
                                      width: desktopSubSectionWidth,
                                      height: 272,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 56, horizontal: 100),
                                    width: desktopSubSectionWidth,
                                    height: 272,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(26),
                                        color: const Color.fromRGBO(
                                            0, 0, 0, 0.74)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
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
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
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
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Expanded(
                                          child: Wrap(
                                            spacing: 30,
                                            runSpacing: 20,
                                            children: [
                                              ...searchmenuItems.map(
                                                (e) => Container(
                                                  alignment: Alignment.center,
                                                  width: 150,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 15),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
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
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
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
                    height: 300,
                  ),
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


Widget divider() {
  return const Row(
    children: [
      SizedBox(
        width: 100,
      ),
      Expanded(
        child: Divider(
          height: 4,
          color: Color.fromARGB(128, 255, 255, 255),
        ),
      ),
      SizedBox(
        width: 100,
      ),
    ],
  );
}
