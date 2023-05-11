import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:theimmibook/screens/404/page_not_found.dart';
import 'package:theimmibook/screens/home_screen/home_screen.dart';

class MyRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: ((context, state) => const MaterialPage(
              child: MyHomePage(title: 'home'),
            )),
      ),
      GoRoute(
        path: '/p1',
        name: 'home1',
        pageBuilder: ((context, state) => const MaterialPage(
              child: MyHomePage(title: 'home1'),
            )),
      ),
      GoRoute(
        path: '/p2',
        name: 'home2',
        pageBuilder: ((context, state) => const MaterialPage(
              child: MyHomePage(title: 'home2'),
            )),
      )
    ],
    errorPageBuilder: (context, state) =>
        const MaterialPage(child: PageNotFound()),
  );
}
