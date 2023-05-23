import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:theimmibook/screens/home_screen/widgets/jobs.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/custom_child_button.dart';
import 'package:theimmibook/utils/widgets/customButton/customButton.dart';

final ImagePicker picker = ImagePicker();
XFile? logo;
List<XFile> companyPhotos = [];

class CreateJob extends StatefulWidget {
  const CreateJob({super.key});

  @override
  State<CreateJob> createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
          child: Container(
              constraints:
                  BoxConstraints(maxWidth: getSubsectionWidth(context)) * 0.85,
              padding: EdgeInsets.symmetric(
                  horizontal: 60 * widthScaleF2F(context: context),
                  vertical: 24),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 37 * widthScaleF2F(context: context),
                    ),
                    Text(
                      'Create Job',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                      textScaleFactor: textScaleF2F(context: context),
                    ),
                    SizedBox(
                      height: 35 * widthScaleF2F(context: context),
                    ),
                    Flex(
                      direction:
                          isMobile(context) ? Axis.vertical : Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 1,
                          child: getColumnModule('Add Company Logo', () async {
                            logo = await picker.pickImage(
                                source: ImageSource.gallery);
                            setState(
                              () {},
                            );
                          }, context),
                        ),
                        SizedBox(
                          width: 37 * widthScaleF2F(context: context),
                        ),
                        Expanded(
                          flex: 1,
                          child:
                              getColumnModule('Add Company Images', () async {
                            companyPhotos = await picker.pickMultiImage();
                          }, context),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 35 * widthScaleF2F(context: context),
                          ),
                        ),
                      ],
                    ),
                    getInputContainer('Company Name'),
                    SizedBox(
                      height: 35 * widthScaleF2F(context: context),
                    ),
                    getInputContainer('Opening Position'),
                    SizedBox(
                      height: 35 * widthScaleF2F(context: context),
                    ),
                    getInputContainer('Job Location'),
                    SizedBox(
                      height: 35 * widthScaleF2F(context: context),
                    ),
                    Flex(
                      direction:
                          isMobile(context) ? Axis.vertical : Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 1,
                          child: getInputContainer(
                            'Select Job Type',
                          ),
                        ),
                        SizedBox(
                          width: 20 * widthScaleF2F(context: context),
                        ),
                        Expanded(
                          flex: 1,
                          child: getInputContainer(
                            'Enter Salary Amount',
                          ),
                        ),
                        SizedBox(
                          width: 20 * widthScaleF2F(context: context),
                        ),
                        Expanded(
                          flex: 1,
                          child: getInputContainer(
                            'Select Salary Period',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35 * widthScaleF2F(context: context),
                    ),
                    getInputContainer('Full Job Description',
                        large: true, trailingText: '50 to 2000 words'),
                    SizedBox(
                      height: 35 * widthScaleF2F(context: context),
                    ),
                    getInputContainer('Write about the company',
                        large: true, trailingText: '50 to 2000 words'),
                    SizedBox(
                      height: 42 * widthScaleF2F(context: context),
                    ),
                    customButton(
                        highlightColor: bodyColorBlue,
                        text: 'Create Job',
                        bgColor: bodyColorBlue,
                        highlightBgColor: textColorWhite,
                        highlightTextColor: bodyColorBlue,
                        textColor: textColorWhite,
                        onPressed: () {}),
                    SizedBox(
                      height: 55 * widthScaleF2F(context: context),
                    ),
                  ])),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}

//
// Widget getDetailedJobHeader(context) {
//   return StatefulBuilder(builder: (context, setState) {
//     return
//   });
// }

Widget getInputContainer(String text, {bool large = false, trailingText = ''}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  color: textColorBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          if (large)
            Text(trailingText,
                style: const TextStyle(
                    color: textColorBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500))
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      SizedBox(
        height: large ? 155 : 70,
        child: const TextField(
            maxLines: 50,
            style: TextStyle(
                color: textColorBlack,
                fontSize: 20,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black54)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black54)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black54)),
            )),
      ),
    ],
  );
}

Widget getColumnModule(String text, dynamic onPressed, context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
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
      InkWell(
        onTap: onPressed,
        child: Container(
          width: double.maxFinite,
          height: 200,
          //constraints: const BoxConstraints( maxHeight: 201),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(8)),
          child: logo != null
              ? Image.network(
                  logo!.path,
                  fit: BoxFit.fill,
                )
              : SizedBox(
                  child: Center(
                    child: SvgPicture.asset(
                      'uploadIcon.svg',
                      height: 30,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
        ),
      ),
    ],
  );
}
