import 'package:flutter/material.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class FormInputContainer extends StatelessWidget {
  final String text;
  const FormInputContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
              color: textColorBlack, fontSize: 16, fontWeight: FontWeight.w500),
          textScaleFactor: textScaleF2F(context: context),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 60 * textScaleF2F(context: context),
          child: TextFormField(
              maxLines: 50,
              style: TextStyle(
                  color: textColorBlack,
                  fontSize: 20 * textScaleF2F(context: context),
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.all(18 * textScaleF2F(context: context)),
                alignLabelWithHint: true,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black54)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black54)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black54)),
              )),
        ),
      ],
    );
  }
}
