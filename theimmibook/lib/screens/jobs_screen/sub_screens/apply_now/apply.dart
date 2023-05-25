import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/apply_now/widgets/experience_details_form.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/apply_now/widgets/personal_details_form.dart';
import 'package:theimmibook/screens/jobs_screen/sub_screens/apply_now/widgets/review_form.dart';
import 'package:theimmibook/screens/jobs_screen/widgets/detailed_job_view.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/detailed_view_holder.dart';
import 'package:theimmibook/utils/widgets/customButton/customButton.dart';

import 'widgets/form_input_container.dart';

class ApplyNow extends StatefulWidget {
  const ApplyNow({super.key});

  @override
  State<ApplyNow> createState() => _ApplyNowState();
}

const Color navRailColor = Color.fromARGB(255, 248, 248, 253);

class _ApplyNowState extends State<ApplyNow> {
  int _currentSection = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return DetailedViewHolder(
      showStickyRibbon: false,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
        child: Column(
          crossAxisAlignment: getScreenWidth(context: context) > 1200
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60 * widthScaleF2F(context: context),
            ),
            Text(
              'Draftsperson with advanced  BIM Software IBM',
              style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
              textScaleFactor: textScaleF2F(context: context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60 * widthScaleF2F(context: context),
            ),
            // if (getScreenWidth(context: context) <= 1200 &&
            //     getScreenWidth(context: context) > 1800)
            //   ConstrainedBox(
            //     constraints:
            //         BoxConstraints(maxWidth: getSubsectionWidth(context) * .70),
            //     child: NavigationBar(
            //       shadowColor: Colors.transparent,
            //       backgroundColor: Color.fromARGB(255, 255, 255, 255),
            //       indicatorColor: bodyBgSecondaryColor,
            //       destinations: [
            //         Container(
            //           alignment: Alignment.center,
            //           padding: EdgeInsets.symmetric(vertical: 2),
            //           decoration: BoxDecoration(
            //             color: navRailColor,
            //             borderRadius: BorderRadius.circular(
            //               11 * widthScaleF2F(context: context),
            //             ),
            //           ),
            //           child: Text(
            //             'Personal Information',
            //             textScaleFactor: textScaleF2F(context: context),
            //             style: TextStyle(fontSize: 14, color: textColorBlack),
            //           ),
            //         ),
            //         Container(
            //           alignment: Alignment.center,
            //           padding: EdgeInsets.symmetric(vertical: 2),
            //           decoration: BoxDecoration(
            //             color: navRailColor,
            //             borderRadius: BorderRadius.circular(
            //               11 * widthScaleF2F(context: context),
            //             ),
            //           ),
            //           child: Text(
            //             'Personal Information',
            //             textScaleFactor: textScaleF2F(context: context),
            //             style: TextStyle(fontSize: 14, color: textColorBlack),
            //           ),
            //         ),
            //         Container(
            //           alignment: Alignment.center,
            //           padding: EdgeInsets.symmetric(vertical: 2),
            //           decoration: BoxDecoration(
            //             color: bodyBgSecondaryColor,
            //             borderRadius: BorderRadius.circular(
            //               11 * widthScaleF2F(context: context),
            //             ),
            //           ),
            //           child: Text(
            //             'Personal Information',
            //             textScaleFactor: textScaleF2F(context: context),
            //             style: TextStyle(fontSize: 14, color: textColorBlack),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (getScreenWidth(context: context) > 1200)
                  Container(
                    decoration: BoxDecoration(
                        color: navRailColor,
                        borderRadius: BorderRadius.circular(
                            18 * widthScaleF2F(context: context))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        getNavigationRailButton(
                            context: context,
                            index: 0,
                            isSelected: _currentSection == 0,
                            subTitle: 'Personal Details',
                            title: 'First Step',
                            updateFunction: () {
                              setState(() {
                                _currentSection = 0;
                                _controller.animateToPage(0,
                                    duration: const Duration(milliseconds: 150),
                                    curve: Curves.linear);
                              });
                            }),
                        getNavigationRailButton(
                            context: context,
                            index: 1,
                            isSelected: _currentSection == 1,
                            subTitle: 'Education and work experience',
                            title: 'Second Step',
                            updateFunction: () {
                              setState(() {
                                _currentSection = 1;
                                _controller.animateToPage(1,
                                    duration: const Duration(milliseconds: 150),
                                    curve: Curves.linear);
                              });
                            }),
                        getNavigationRailButton(
                            context: context,
                            index: 2,
                            isSelected: _currentSection == 2,
                            subTitle: 'Review and submit',
                            title: 'Third Step',
                            updateFunction: () {
                              setState(() {
                                _currentSection = 2;
                                _controller.animateToPage(2,
                                    duration: const Duration(milliseconds: 150),
                                    curve: Curves.linear);
                              });
                            }),
                      ],
                    ),
                  ),
                if (getScreenWidth(context: context) > 1200)
                  SizedBox(
                    width: 60 * widthScaleF2F(context: context),
                  ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: isMobile(context)
                            ? 1200 * widthScaleF2F(context: context) * 3.5
                            : 1200),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      allowImplicitScrolling: false,
                      children: [
                        PersonalDetailsForm(
                          controller: _controller,
                        ),
                        ExperienceDetailsForm(),
                        ReviewForm(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget getNavigationRailButton(
    {required int index,
    required String title,
    required String subTitle,
    required updateFunction,
    required bool isSelected,
    required context}) {
  return InkWell(
    onTap: updateFunction,
    child: AnimatedContainer(
      padding: EdgeInsets.symmetric(
          vertical: 20 * widthScaleF2F(context: context),
          horizontal: 47 * widthScaleF2F(context: context)),
      alignment: Alignment.centerLeft,
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: isSelected ? bodyBgSecondaryColor : navRailColor,
          borderRadius:
              BorderRadius.circular(20 * widthScaleF2F(context: context))),
      height: 192,
      width: 276,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromRGBO(119, 119, 228, 1),
            radius: 22 * textScaleF2F(context: context),
            child: Text(
              '0${index + 1}',
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: textColorWhite),
              textScaleFactor: textScaleF2F(context: context),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: textColorBlack),
            textScaleFactor: textScaleF2F(context: context),
          ),
          Text(
            subTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                height: 2,
                fontSize: 14,
                color: Color.fromRGBO(136, 136, 136, 1)),
            textScaleFactor: textScaleF2F(context: context),
          )
        ],
      ),
    ),
  );
}
