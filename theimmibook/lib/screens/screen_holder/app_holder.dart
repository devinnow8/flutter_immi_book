import 'package:flutter/material.dart';

class AppHolder extends StatefulWidget {
  final Widget child;
  const AppHolder({super.key, required this.child});

  @override
  State<AppHolder> createState() => _AppHolderState();
}

class _AppHolderState extends State<AppHolder> {
  @override
  Widget build(BuildContext context) {
    final bool showDrawer = (MediaQuery.of(context).size.width < 576);
    return Scaffold(
      endDrawer: showDrawer
          ? Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Explorer', style: TextStyle(fontSize: 12)),
                  Text('Explorer', style: TextStyle(fontSize: 12)),
                ],
              ),
            )
          : null,

      appBar: AppBar(
        leadingWidth: 220,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(
                width: 10,
              ),
              FlutterLogo(
                size: 50,
              ),
              Text(
                'Check Events',
                style: TextStyle(fontWeight: FontWeight.w600),
                textScaleFactor: 1.8,
              ),
            ],
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: showDrawer || MediaQuery.of(context).size.width < 950
            ? null
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(133, 225, 225, 225)),
                constraints: const BoxConstraints(
                  maxWidth: 400,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search events',
                      textScaleFactor: 0.68,
                    )
                  ],
                ),
              ),
        actions: const [],
      ),

      body: widget
          .child, //this child is dynamically replaced with corresponding page when we navigate
    );
  }
}
