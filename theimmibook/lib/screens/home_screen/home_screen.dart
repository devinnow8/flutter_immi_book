import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/services/state_management/controllers.dart';
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
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
