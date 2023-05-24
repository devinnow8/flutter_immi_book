import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:theimmibook/screens/404/page_not_found.dart';
import 'package:theimmibook/screens/accommodations_screen/accomodations_screen.dart';
import 'package:theimmibook/screens/home_screen/home_screen.dart';
import 'package:theimmibook/screens/jobs_screen/jobs_screen.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/apply_now/apply.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/create_job/create_job.dart';
import 'package:theimmibook/screens/jobs_screen/widgets/detailed_job_view.dart';
import 'package:theimmibook/utils/custom_routing_transition.dart';
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
        path: '/jobDetails',
        name: 'detailedJobView',
        pageBuilder: ((context, state) => const MaterialPage(
              child: DetailedJobView(),
            )),
      ),
      GoRoute(
        path: '/createJob',
        name: 'createJob',
        pageBuilder: ((context, state) => const MaterialPage(
              child: CreateJob()
            )),
      ),
      GoRoute(
        path: '/applyNow',
        name: 'applyNow',
        pageBuilder: ((context, state) =>
            RouterTransitionFactory.getTransitionPage(
                child: const ApplyNow(),
                context: context,
                state: state,
                duration: const Duration(milliseconds: 250),
                type: 'fade')),
      )
    ],
    errorPageBuilder: (context, state) =>
        const MaterialPage(child: PageNotFound()),
  );
}
