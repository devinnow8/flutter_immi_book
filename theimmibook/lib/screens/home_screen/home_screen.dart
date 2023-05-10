import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/services/state_management/controllers.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = getScreenWidth(context: context);
    double maxWidth = 1920 - designHorizontalPadding * 2;
    if (screenWidth <= 1200) {
      maxWidth = 1920 - designHorizontalPadding * 2;
    }
    return SelectionArea(
      child: Scrollbar(
        trackVisibility: true,
        controller: _scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                  width: getScreenWidth(context: context),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'hero.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 728,
                        child: Text(
                          'heroTagline'.tr,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )),
              Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'underConstruction'.tr,
                    ),
                    Text(
                      '${authStateController.test}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    ...dummyCards.map((e) => sectionCard((maxWidth / 3) - 20))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




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
