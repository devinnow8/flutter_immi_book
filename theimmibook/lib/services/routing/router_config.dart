import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:theimmibook/screens/404/page_not_found.dart';
import 'package:theimmibook/screens/accommodations_screen/accomodations_screen.dart';
import 'package:theimmibook/screens/home_screen/home_screen.dart';
import 'package:theimmibook/screens/jobs_screen/jobs_screen.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/apply_now/create_job.dart';
import 'package:theimmibook/screens/jobs_screen/widgets/detailed_job_view.dart';
import 'package:theimmibook/utils/widgets/common/detailed_view_holder.dart';

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
        path: '/accommodations',
        name: 'accommodations',
        pageBuilder: ((context, state) => const MaterialPage(
              child: MyAccommodationsPage(),
            )),
      ),
      GoRoute(
        path: '/details',
        name: 'detailedView',
        pageBuilder: ((context, state) => const MaterialPage(
              child: DetailedViewHolder(
                showStickyRibbon: true,
                body: DetailedJobView(),
              ),
            )),
      ),
      GoRoute(
        path: '/createJob',
        name: 'createJob',
        pageBuilder: ((context, state) => const MaterialPage(
              child: DetailedViewHolder(
                showStickyRibbon: false,
                body: CreateJob(),
              ),
            )),
      )
    ],
    errorPageBuilder: (context, state) =>
        const MaterialPage(child: PageNotFound()),
  );
}
