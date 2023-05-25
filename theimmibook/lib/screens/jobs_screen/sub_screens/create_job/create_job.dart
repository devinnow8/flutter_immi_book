import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:theimmibook/screens/home_screen/widgets/jobs.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/custom_child_button.dart';
import 'package:theimmibook/utils/widgets/common/detailed_view_holder.dart';
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
    return DetailedViewHolder(
      showStickyRibbon: false,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
        child: Container(
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
                  const SizedBox(
                    height: 35,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 500),
                    child: Flex(
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
                  getInputContainer('Company Name', context: context),
                  SizedBox(
                    height: 35 * widthScaleF2F(context: context),
                  ),
                  getInputContainer('Opening Position', context: context),
                  SizedBox(
                    height: 35 * widthScaleF2F(context: context),
                  ),
                  getInputContainer('Job Location', context: context),
                  SizedBox(
                    height: 35 * widthScaleF2F(context: context),
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
                          child: getDropDownContainer('Select Job Type',
                              context: context,
                              options: [
                                'Full Time',
                                'Part Time',
                                'Apprenticeship',
                                'Internship'
                              ]),
                        ),
                        SizedBox(
                          width: 20 * widthScaleF2F(context: context),
                        ),
                        Expanded(
                          flex: 1,
                          child: getInputContainer('Enter Salary Amount',
                              context: context),
                        ),
                        SizedBox(
                          width: 20 * widthScaleF2F(context: context),
                        ),
                        Expanded(
                          flex: 1,
                          child: getDropDownContainer('Select Salary Period',
                              options: [
                                'Monthly',
                                'Hourly',
                              ],
                              context: context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35 * widthScaleF2F(context: context),
                  ),
                  getInputContainer('Full Job Description',
                      context: context,
                      large: true,
                      trailingText: '50 to 2000 words'),
                  SizedBox(
                    height: 35 * widthScaleF2F(context: context),
                  ),
                  getInputContainer('Write about the company',
                      context: context,
                      large: true,
                      trailingText: '50 to 2000 words'),
                  const SizedBox(
                    height: 42,
                  ),
                  CustomButton(
                      highlightColor: bodyColorBlue,
                      text: 'Create Job',
                      bgColor: bodyColorBlue,
                      highlightBgColor: textColorWhite,
                      highlightTextColor: bodyColorBlue,
                      textColor: textColorWhite,
                      onPressed: () {}),
                  SizedBox(
                    height: 32 * widthScaleF2F(context: context),
                  )
                ])),
      ),
    );
  }
}

Widget getInputContainer(String text,
    {bool large = false,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    dynamic validator,
    trailingText = '',
    required context,
    List<TextInputFormatter> inputFormatters = const []}) {
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
              textScaleFactor: textScaleF2F(context: context),
            ),
          ),
          if (large)
            Text(
              trailingText,
              style: const TextStyle(
                  color: textColorBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              textScaleFactor: textScaleF2F(context: context),
            )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: large
            ? 155 * textScaleF2F(context: context)
            : 60 * textScaleF2F(context: context),
        child: TextFormField(
            autovalidateMode: autovalidateMode,
            validator: validator,
            inputFormatters: inputFormatters,
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

Widget getDropDownContainer(String text,
    {required context, required List options}) {
  int selectedIndex = 0;
  return StatefulBuilder(builder: (context, setState) {
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
                textScaleFactor: textScaleF2F(context: context),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 60 * textScaleF2F(context: context),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: 14 * widthScaleF2F(context: context)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1, color: Colors.black54),
              ),
              child: DropdownButton(
                  value: options[selectedIndex],
                  dropdownColor: Colors.white,
                  underline: const SizedBox(),
                  style: TextStyle(
                      color: textColorBlack,
                      fontSize: 20 * textScaleF2F(context: context)),
                  isExpanded: true,
                  // value: Text('Internship'),

                  icon: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: textColorBlack,
                  ),
                  items: [
                    ...options.map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                          ),
                        ))
                  ],
                  onChanged: (_) {
                    setState(
                      () => selectedIndex = options.indexOf(_),
                    );
                  }),
            )),
      ],
    );
  });
}
