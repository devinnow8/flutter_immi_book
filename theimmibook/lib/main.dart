import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/routes/routes.dart';
import 'package:theimmibook/screens/screen_holder/app_holder.dart';
import 'package:theimmibook/utils/app_translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
        title: 'The ImmiBook',
        translationsKeys: AppTranslation.translationsKeys,
        fallbackLocale: const Locale('en', 'US'),
        locale: const Locale('en', 'Us'),
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: const Color.fromARGB(255, 0, 0, 0),
                onPrimary: Colors.white,
                secondary: const Color.fromARGB(255, 115, 229, 185),
                onSecondary: const Color.fromARGB(255, 255, 255, 255),
                error: Colors.yellow.shade100,
                onError: Colors.yellow.shade700,
                background: const Color.fromARGB(255, 241, 241, 241),
                onBackground: Colors.black54,
                surface: const Color.fromARGB(255, 255, 255, 255),
                onSurface: Colors.black54)),
        getPages: AppPages.pages,
        routeInformationParser: AppInformationParser(),
        unknownRoute: AppPages.pages[0],
        transitionDuration: Duration.zero,
        routerDelegate: AppRouterDelegate(),
        builder: (context, child) {
          return Overlay(initialEntries: [
            OverlayEntry(
                builder: (context) =>
                    AppHolder(child: child ?? const SizedBox()))
          ]);
        });
  }
}
