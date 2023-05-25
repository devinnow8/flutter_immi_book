import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/apply_now/widgets/form_container.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/create_job/create_job.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/save_cancel_pair.dart';

import 'form_input_container.dart';

class ExperienceDetailsForm extends StatelessWidget {
  const ExperienceDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FormContainer(
            title: 'Add Education',
            body: Form(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FormInputContainer(
                  text: 'Institution Name',
                ),
                SizedBox(
                  height: 25 * textScaleF2F(context: context),
                ),
                const FormInputContainer(
                  text: 'Course Name',
                ),
                SizedBox(
                  height: 25 * textScaleF2F(context: context),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: isMobile(context)
                          ? 350 * widthScaleF2F(context: context) * 3
                          : 120),
                  child: Flex(
                    mainAxisSize: MainAxisSize.min,
                    direction:
                        isMobile(context) ? Axis.vertical : Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: getDropDownContainer('Started',
                            context: context,
                            options: [
                              ...List.generate(
                                  100, (index) => (2023 - index).toString())
                            ]),
                      ),
                      SizedBox(
                        width: 20 * widthScaleF2F(context: context),
                      ),
                      Expanded(
                        flex: 1,
                        child: getDropDownContainer('End',
                            options: [
                              ...List.generate(
                                  100, (index) => (2023 - index).toString())
                            ],
                            context: context),
                      ),
                      if (!isMobile(context))
                        const Expanded(flex: 1, child: Row()),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Qualification complete',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                      textScaleFactor: textScaleF2F(context: context),
                    ),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child:
                            Checkbox.adaptive(value: false, onChanged: (_) {}))
                  ],
                ),
                SizedBox(
                  height: 20 * widthScaleF2F(context: context),
                ),
                SaveAndCancelButtonPair(onSave: () {}, onCancel: () {}),
                SizedBox(
                  height: 30 * widthScaleF2F(context: context),
                ),
              ],
            )),
          ),
          FormContainer(
            title: 'Add Experience',
            body: Form(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FormInputContainer(
                  text: 'Job title',
                ),
                SizedBox(
                  height: 25 * textScaleF2F(context: context),
                ),
                const FormInputContainer(
                  text: 'Company name',
                ),
                SizedBox(
                  height: 25 * textScaleF2F(context: context),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: isMobile(context)
                          ? 350 * widthScaleF2F(context: context) * 3
                          : 120),
                  child: Flex(
                    mainAxisSize: MainAxisSize.min,
                    direction:
                        isMobile(context) ? Axis.vertical : Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: getDropDownContainer('Started',
                            context: context,
                            options: [
                              ...List.generate(
                                  100, (index) => (2023 - index).toString())
                            ]),
                      ),
                      SizedBox(
                        width: 20 * widthScaleF2F(context: context),
                      ),
                      Expanded(
                        flex: 1,
                        child: getDropDownContainer('',
                            options: [
                              ...List.generate(
                                  12, (index) => (index + 1).toString())
                            ],
                            context: context),
                      ),
                      if (!isMobile(context))
                        const Expanded(flex: 1, child: Row()),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: isMobile(context)
                          ? 350 * widthScaleF2F(context: context) * 3
                          : 120),
                  child: Flex(
                    mainAxisSize: MainAxisSize.min,
                    direction:
                        isMobile(context) ? Axis.vertical : Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: getDropDownContainer('End',
                            context: context,
                            options: [
                              ...List.generate(
                                  100, (index) => (2023 - index).toString())
                            ]),
                      ),
                      SizedBox(
                        width: 20 * widthScaleF2F(context: context),
                      ),
                      Expanded(
                        flex: 1,
                        child: getDropDownContainer('',
                            options: [
                              ...List.generate(
                                  12, (index) => (index + 1).toString())
                            ],
                            context: context),
                      ),
                      if (!isMobile(context))
                        const Expanded(flex: 1, child: Row()),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Still Working',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                      textScaleFactor: textScaleF2F(context: context),
                    ),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child:
                            Checkbox.adaptive(value: false, onChanged: (_) {}))
                  ],
                ),
                SizedBox(
                  height: 20 * widthScaleF2F(context: context),
                ),
                const FormInputContainer(
                  text: 'Company address',
                ),
                SizedBox(
                  height: 25 * textScaleF2F(context: context),
                ),
                getInputContainer('Description', context: context, large: true),
                SizedBox(
                  height: 25 * textScaleF2F(context: context),
                ),
                SaveAndCancelButtonPair(onSave: () {}, onCancel: () {}),
                SizedBox(
                  height: 30 * widthScaleF2F(context: context),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
