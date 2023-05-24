import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/apply_now/widgets/form_container.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/create_job/create_job.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

import 'form_input_container.dart';

class PersonalDetailsForm extends StatelessWidget {
  const PersonalDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: 'Personal Details',
      body: Form(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: isMobile(context)
                    ? 230 * textScaleF2F(context: context)
                    : 100),
            child: Flex(
              direction: isMobile(context) ? Axis.vertical : Axis.horizontal,
              children: [
                Expanded(
                    child: getInputContainer('First Name*',
                        context: context,
                        inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]'))
                    ])),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                    child: getInputContainer('Last Name*',
                        context: context,
                        inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]'))
                    ])),
              ],
            ),
          ),
          SizedBox(
            height: 25 * textScaleF2F(context: context),
          ),
          const FormInputContainer(
            text: 'Your Address*',
          ),
          SizedBox(
            height: 25 * textScaleF2F(context: context),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: isMobile(context)
                    ? 230 * textScaleF2F(context: context)
                    : 110),
            child: Flex(
              direction: isMobile(context) ? Axis.vertical : Axis.horizontal,
              children: [
                Expanded(
                    child: getInputContainer('Phone Number*',
                        context: context,
                        inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))
                    ])),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                    child: getInputContainer('Email ID*',
                        context: context,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (_) {
                  // print(_);
                })),
              ],
            ),
          ),
          SizedBox(
            height: 65 * widthScaleF2F(context: context),
          ),
        ],
      )),
    );
  }
}
