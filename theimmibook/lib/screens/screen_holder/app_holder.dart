import 'package:flutter/material.dart';
import 'package:theimmibook/utils/widgets/app_bar/appbar.dart';

class AppHolder extends StatefulWidget {
  final Widget child;
  const AppHolder({super.key, required this.child});

  @override
  State<AppHolder> createState() => _AppHolderState();
}

class _AppHolderState extends State<AppHolder> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: getAppBar(context, 0),

        body: widget
            .child, //this child is dynamically replaced with corresponding page when we navigate
      ),
    );
  }
}
