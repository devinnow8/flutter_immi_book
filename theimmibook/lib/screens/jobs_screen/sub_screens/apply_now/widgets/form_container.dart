import 'package:flutter/material.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class FormContainer extends StatelessWidget {
  final Widget body;
  final String title;
  const FormContainer({super.key, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          constraints: BoxConstraints(
                  maxWidth: isMobile(context)
                      ? getSubsectionWidth(context)
                      : getSubsectionWidth(context)) *
              0.70,
          padding: EdgeInsets.symmetric(
              horizontal: 60 * widthScaleF2F(context: context), vertical: 24),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(33, 0, 0, 0),
                    spreadRadius: 2,
                    blurRadius: 12)
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 37 * widthScaleF2F(context: context),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 22,
                    color: bodyBgTertiaryColor,
                    fontWeight: FontWeight.w800),
                textScaleFactor: textScaleF2F(context: context),
              ),
              SizedBox(
                height: 32 * widthScaleF2F(context: context),
              ),
              body,
            ],
          ),
        ),
        SizedBox()
      ],
    );
  }
}
