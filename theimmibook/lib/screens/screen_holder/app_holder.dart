import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/widgets/app_bar/appbar.dart';
import 'package:theimmibook/utils/widgets/common/nav_link.dart';

class AppHolder extends StatefulWidget {
  final Widget child;
  const AppHolder({super.key, required this.child});

  @override
  State<AppHolder> createState() => _AppHolderState();
}

class _AppHolderState extends State<AppHolder> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'immibookTitle'.tr,
              style: Theme.of(context).textTheme.displayLarge,
              textScaleFactor: 1,
            ),
            ...navMenuItems.map(
              (e) => Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                child: NavLink(
                    text: e,
                    onClick: () {
                      print('Clicked');
                    },
                    style: Theme.of(context).textTheme.displayMedium),
              ),
            ),
            NavLink(
                text: 'register'.tr,
                onClick: () {},
                style: Theme.of(context).textTheme.displayMedium)
          ],
        ),
      ),

      appBar: getAppBar(context, _width, _scaffoldKey),

      body: widget
          .child, //this child is dynamically replaced with corresponding page when we navigate
    );
  }
}
