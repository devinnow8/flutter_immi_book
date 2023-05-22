import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:theimmibook/screens/404/page_not_found.dart';
import 'package:theimmibook/screens/home_screen/home_screen.dart';
import 'package:theimmibook/screens/jobs_screen/jobs_screen.dart';

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
        path: '/jobs',
        name: 'jobs',
        pageBuilder: ((context, state) => const MaterialPage(
              child: MyJobsPage(),
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
