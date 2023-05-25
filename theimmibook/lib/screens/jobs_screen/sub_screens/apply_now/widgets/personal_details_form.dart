import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/apply_now/widgets/form_container.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/create_job/create_job.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/custom_icon_button.dart';
import 'package:theimmibook/utils/widgets/common/save_cancel_pair.dart';
import 'package:theimmibook/utils/widgets/customButton/customButton.dart';

import 'form_input_container.dart';

class PersonalDetailsForm extends StatefulWidget {
  final PageController controller;
  const PersonalDetailsForm({super.key, required this.controller});

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  String fileInfo =
      '''Accepted file types: .doc, .docx, .pdf, .txt and .rtf (2MB limit).
Resumé will be stored in your SEEK Profile.''';
  String coverLetterStatus = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormContainer(
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
                  direction:
                      isMobile(context) ? Axis.vertical : Axis.horizontal,
                  children: [
                    Expanded(
                        child: getInputContainer('First Name*',
                            context: context,
                            inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-z A-Z]'))
                        ])),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                        child: getInputContainer('Last Name*',
                            context: context,
                            inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-z A-Z]'))
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
                  direction:
                      isMobile(context) ? Axis.vertical : Axis.horizontal,
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
        ),
        FormContainer(
          title: '',
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(),
              Text(
                'Resume',
                style: const TextStyle(color: textColorBlack, fontSize: 16),
                textScaleFactor: textScaleF2F(context: context),
              ),
              SizedBox(
                height: 15 * textScaleF2F(context: context),
              ),
              CustomButton(
                  customfontSize: 20,
                  customFontWeight: FontWeight.w800,
                  smallButton: true,
                  highlightColor: bodyColorBlue,
                  text: 'Upload a resume',
                  bgColor: Colors.white,
                  highlightBgColor: bodyColorBlue,
                  highlightTextColor: textColorWhite,
                  textColor: bodyColorBlue,
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['doc', 'pdf', 'docx', 'rft'],
                    );

                    if (result != null) {
                      // File file = File(result.files.single.path ?? '');

                      setState(() {
                        fileInfo = result.files.single.name;
                      });
                    } else {
                      // User canceled the picker
                    }
                  }),
              SizedBox(
                height: 25 * textScaleF2F(context: context),
              ),
              Text(
                fileInfo,
                style: const TextStyle(color: textColorBlack, fontSize: 12),
                textScaleFactor: textScaleF2F(context: context),
              ),
              SizedBox(
                height: 35 * textScaleF2F(context: context),
              ),
              Text(
                'Cover letter',
                style: const TextStyle(color: textColorBlack, fontSize: 16),
                textScaleFactor: textScaleF2F(context: context),
              ),
              SizedBox(
                height: 15 * textScaleF2F(context: context),
              ),
              Row(
                children: [
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey),
                      activeColor: Colors.black,
                      value: 'uploadCoverLetter',
                      groupValue: coverLetterStatus,
                      onChanged: (v) {
                        setState(() {
                          coverLetterStatus = v.toString();
                        });
                      }),
                  Expanded(
                    child: Text(
                      'Upload a cover Letter',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      textScaleFactor: textScaleF2F(context: context),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey),
                      activeColor: Colors.black,
                      value: 'noCoverLetter',
                      groupValue: coverLetterStatus,
                      onChanged: (v) {
                        setState(() {
                          coverLetterStatus = v.toString();
                        });
                      }),
                  Expanded(
                    child: Text(
                      "Don't include a cover letter",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      textScaleFactor: textScaleF2F(context: context),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 45 * widthScaleF2F(context: context),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 45 * widthScaleF2F(context: context),
        ),
        SaveAndCancelButtonPair(onSave: () {
          widget.controller.animateToPage(1,
              duration: const Duration(milliseconds: 150),
              curve: Curves.linear);
        }, onCancel: () {
          widget.controller.animateToPage(1,
              duration: const Duration(milliseconds: 150),
              curve: Curves.linear);
        }),
        SizedBox(
          height: 55 * widthScaleF2F(context: context),
        ),
      ],
    );
  }
}
