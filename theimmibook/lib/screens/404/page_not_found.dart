import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '404 : page not found!',
          textScaleFactor: 6,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
