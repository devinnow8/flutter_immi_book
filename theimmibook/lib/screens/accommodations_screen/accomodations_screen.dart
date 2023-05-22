import 'package:flutter/material.dart';
import 'package:theimmibook/screens/accommodations_screen/widgets/accommodations.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/header.dart';

import '../home_screen/widgets/footer.dart';

class MyAccommodationsPage extends StatefulWidget {
  const MyAccommodationsPage({super.key});

  @override
  State<MyAccommodationsPage> createState() => _MyAccommodationsPageState();
}

class _MyAccommodationsPageState extends State<MyAccommodationsPage> {
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
                  const Header(
                    title: 'Accommodations',
                  ),
                  SizedBox(
                    height: isMobile(context)
                        ? 70 * widthScaleF2F(context: context)
                        : 50,
                  ),
                  const Accommodations(),
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
