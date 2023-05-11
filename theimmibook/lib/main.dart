import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theimmibook/routes/routes.dart';
import 'package:theimmibook/services/routing/router_config.dart';
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
        fallbackLocale: const Locale(
          'en',
          'US',
        ),
        locale: const Locale(
          'en',
          'Us',
        ),
        theme: ThemeData(
            
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(fontSize: 70, fontWeight: FontWeight.w700),
              bodyMedium: TextStyle(fontSize: 30),
              bodySmall: TextStyle(fontSize: 16),
              displayLarge: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(255, 255, 255, 1),
              ),
              displayMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            useMaterial3: true,
            colorScheme: ColorScheme(
              brightness: Brightness.dark,
                primary: const Color.fromARGB(255, 0, 0, 0),
                onPrimary: Colors.white,
              secondary: const Color.fromRGBO(24, 23, 28, 0.5),
                onSecondary: const Color.fromARGB(255, 255, 255, 255),
                error: Colors.yellow.shade100,
                onError: Colors.yellow.shade700,
              background: const Color.fromRGBO(45, 45, 45, 1),
                onBackground: Colors.black54,
              surface: const Color.fromRGBO(45, 45, 45, 1),
              onSurface: const Color.fromARGB(255, 255, 255, 255),
            ),
            fontFamily: GoogleFonts.robotoSlab().fontFamily),
        getPages: AppPages.pages,
      routeInformationParser: MyRouter().router.routeInformationParser,
      //  unknownRoute: AppPages.pages[0],
        transitionDuration: Duration.zero,
      routerDelegate: MyRouter().router.routerDelegate,
    );
  }
}
