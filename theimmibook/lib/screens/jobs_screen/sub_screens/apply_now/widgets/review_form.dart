import 'package:flutter/material.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/apply_now/widgets/form_container.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

import 'form_input_container.dart';

class ReviewForm extends StatelessWidget {
  const ReviewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: 'Review',
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Form(
            child: Column(
          children: [
            // Flex(
            //   direction: isMobile(context)
            //       ? Axis.vertical
            //       : Axis.horizontal,
            //   children: [
            //     getInputContainer('First Name*',
            //         context: context),
            //     getInputContainer('Last Name*',
            //         context: context),
            //   ],
            // ),
            FormInputContainer(
              text: 'Your Address*',
            ),
            // Flex(
            //   direction: isMobile(context)
            //       ? Axis.vertical
            //       : Axis.horizontal,
            //   children: [
            //     getInputContainer('Phone Number*',
            //         context: context),
            //     getInputContainer('Email ID*',
            //         context: context),
            //   ],
            // ),
          ],
        ))
      ]),
    );
  }
}
