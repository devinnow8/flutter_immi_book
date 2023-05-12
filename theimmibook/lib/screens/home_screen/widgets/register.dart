import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (buildContext, constraints) {
        bool isMobile = constraints.maxWidth <= mobileWidth;
        bool mediumLargeScreen = false;
        bool smallLargeScreen = false;
        if (constraints.maxWidth <= 1360) {
          smallLargeScreen = true;
        } else if (constraints.maxWidth <= 1700) {
          mediumLargeScreen = true;
        }

        log(constraints.maxWidth.toString());
        return Container(
          width: getScreenWidth(context: context),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: NetworkImage(
                  "data:image/jpeg;base64,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"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.7), BlendMode.darken),
            ),
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    height: 130,
                  ),
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: smallLargeScreen
                        ? desktopSubSectionWidth * 0.75
                        : desktopSubSectionWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'registerTitle'.tr,
                      textScaleFactor: textScaleF2F(context: context),
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 60),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: smallLargeScreen
                        ? designScreenWidth
                        : constraints.maxWidth - 80),
                child: Text(
                  'registerDescription'.tr,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                onHover: (_) {
                  _hover.value = _;
                },
                onPressed: () {},
                child: Obx(
                  () => AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: !(_hover.value) ? accentColor : Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 60),
                      child: Text(
                        'Register now',
                        textScaleFactor: textScaleF2F(context: context),
                        style: TextStyle(
                            color: _hover.value ? accentColor : Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      )),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        );
      },
    );
  }
}

var _hover = false.obs;
