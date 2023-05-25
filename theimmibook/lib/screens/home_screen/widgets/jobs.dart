import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:theimmibook/screens/jobs_screen/widgets/detailed_job_view.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/customButton/customButton.dart';

class Jobs extends StatefulWidget {
  bool miniWidget;
  Jobs({super.key, this.miniWidget = true});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.miniWidget == true)
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
          child: Container(
            constraints: BoxConstraints(maxWidth: getSubsectionWidth(context)),
            child: getHeadingAndOptions(
              context: context,
              title: 'jobsTitle'.tr,
                options: InkWell(
                  onTap: () {
                    GoRouter.of(context).pushNamed('jobs');
                  },
                  child: Text(
                    'viewAllJobs'.tr,
                    style: sectionHeadingOptionsStyle,
                    textScaleFactor: textScaleF2F(context: context),
                  ),
                ),
              ),
            ),
          ),
      
        SizedBox(
          height:
              isMobile(context) ? 100 * widthScaleF2F(context: context) : 60,
        ),
        if (getScreenWidth(context: context) <= 850)
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [...jobCardsData.map((e) => jobCardMobile())],
            ),
          ),
        if (getScreenWidth(context: context) > 850)
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: getSubsectionWidth(context)),
              child: Column(
                children: [
                  ...jobCardsData.map((e) => jobCard()).toList(),
                  if (widget.miniWidget == false)
                    ...jobCardsData.map((e) => jobCard()).toList()
                ],
              ),
            ),
          ),
        const SizedBox(
          height: 150,
        )
      ],
    );
  }
}

Widget jobCard() {
  String title = jobCardsData[0]['jobTitle'];
  String employer = jobCardsData[0]['employer'];
  String description = jobCardsData[0]['description'];
  String imageUrl = jobCardsData[0]['imageUrl'];
  var scale = 1.0.obs;

  return StatefulBuilder(builder: (context, setState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: MouseRegion(
          onEnter: (event) {
            scale.value = 1.01;
          },
          onExit: (event) {
            scale.value = 1;
          },
          child: Obx(
            () => AnimatedScale(
              duration: const Duration(milliseconds: 150),
              scale: scale.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: scale.value != 1
                              ? Colors.black54
                              : Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 1)
                    ],
                    borderRadius: BorderRadius.circular(
                        30 * widthScaleF2F(context: context))),
                padding: EdgeInsets.symmetric(
                    horizontal: 60 * widthScaleF2F(context: context),
                    vertical: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: textColorBlack,
                            ),
                            textScaleFactor: textScaleF2F(context: context),
                          ),
                          SizedBox(
                            height: 35 * widthScaleF2F(context: context),
                          ),
                          Text(
                            employer,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: accentColor,
                            ),
                            textScaleFactor: textScaleF2F(context: context),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'locationPin.svg',
                                fit: BoxFit.fitHeight,
                                height: widthScaleF2F(context: context) * 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  jobCardsData[0]['location'],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: textColorBlack,
                                  ),
                                  textScaleFactor:
                                      textScaleF2F(context: context),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20 * widthScaleF2F(context: context),
                          ),
                          Text(
                            description,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: textColorBlack,
                            ),
                            textScaleFactor: textScaleF2F(context: context),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: getScreenWidth(context: context) < 1100
                          ? 4
                          : (getScreenWidth(context: context) < 1520 ? 3 : 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomButton(
                                highlightTextColor:
                                    const Color.fromRGBO(47, 47, 170, 1),
                                highlightBgColor: Colors.white,
                                smallButton: true,
                                onPressed: () {
                                  GoRouter.of(context).pushNamed(
                                    'detailedJobView',
                                  );
                                  print('clicked');
                                },
                                textColor: textColorWhite,
                                highlightColor:
                                    const Color.fromRGBO(47, 47, 170, 1),
                                bgColor: const Color.fromRGBO(47, 47, 170, 1),
                                text: '\$61,000 per year',
                              ),
                              PopupMenuButton<int>(
                                  padding: EdgeInsets.zero,
                                  color: Colors.white,
                                  tooltip: '',
                                  iconSize: 40,
                                  offset: Offset.fromDirection(
                                    -0.5,
                                    -45,
                                  ),
                                  position: PopupMenuPosition.over,
                                  icon: const Icon(
                                    Icons.more_vert_rounded,
                                    color: textColorBlack,
                                  ),
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuItem<int>>[
                                        getPopUpMenuItem(
                                            iconData:
                                                Icons.bookmark_outline_sharp,
                                            text: 'Save job',
                                            context: context,
                                            index: 1),
                                        getPopUpMenuItem(
                                            iconData:
                                                Icons.not_interested_outlined,
                                            text: 'Not interested',
                                            context: context,
                                            index: 2),
                                        getPopUpMenuItem(
                                            iconData: Icons.flag_outlined,
                                            text: 'Report job',
                                            context: context,
                                            index: 3),
                                      ],
                                  onSelected: (int value) {})
                            ],
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.av_timer_sharp,
                                color: accentColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                '24 hrs ago',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: accentColor,
                                ),
                                textScaleFactor: textScaleF2F(context: context),
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  });
}

Widget jobCardMobile() {
  String title = jobCardsData[0]['jobTitle'];
  String employer = jobCardsData[0]['employer'];
  String description = jobCardsData[0]['description'];
  String imageUrl = jobCardsData[0]['imageUrl'];
  var scale = 1.0.obs;

  return StatefulBuilder(builder: (context, setState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: MouseRegion(
          onEnter: (event) {
            scale.value = 1.01;
          },
          onExit: (event) {
            scale.value = 1;
          },
          child: Obx(
            () => AnimatedScale(
              duration: const Duration(milliseconds: 150),
              scale: scale.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: scale.value != 1
                              ? Colors.black54
                              : Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 1)
                    ],
                    borderRadius: BorderRadius.circular(
                        30 * widthScaleF2F(context: context))),
                padding: EdgeInsets.symmetric(
                    horizontal: 60 * widthScaleF2F(context: context),
                    vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flex(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 9,
                          child: Text(
                            title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: textColorBlack,
                            ),
                            textScaleFactor: textScaleF2F(context: context),
                          ),
                        ),
                        PopupMenuButton<int>(
                            padding: EdgeInsets.zero,
                            color: Colors.white,
                            tooltip: '',
                            iconSize: 30 * textScaleF2F(context: context),
                            offset: Offset.fromDirection(
                              -0.5,
                              -45,
                            ),
                            position: PopupMenuPosition.over,
                            icon: const Icon(
                              Icons.more_vert_rounded,
                              color: textColorBlack,
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuItem<int>>[
                                  getPopUpMenuItem(
                                      iconData: Icons.bookmark_outline_sharp,
                                      text: 'Save job',
                                      context: context,
                                      index: 1),
                                  getPopUpMenuItem(
                                      iconData: Icons.not_interested_outlined,
                                      text: 'Not interested',
                                      context: context,
                                      index: 2),
                                  getPopUpMenuItem(
                                      iconData: Icons.flag_outlined,
                                      text: 'Report job',
                                      context: context,
                                      index: 3),
                                ],
                            onSelected: (int value) {
                              setState(() {
                                // _value = value;
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.av_timer_sharp,
                          color: accentColor,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '24 hrs ago',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: accentColor,
                          ),
                          textScaleFactor: textScaleF2F(context: context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35 * widthScaleF2F(context: context),
                    ),
                    Text(
                      employer,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: accentColor,
                      ),
                      textScaleFactor: textScaleF2F(context: context),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'locationPin.svg',
                          fit: BoxFit.fitHeight,
                          height: widthScaleF2F(context: context) * 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          jobCardsData[0]['location'],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: textColorBlack,
                          ),
                          textScaleFactor: textScaleF2F(context: context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20 * widthScaleF2F(context: context),
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColorBlack,
                      ),
                      textScaleFactor: textScaleF2F(context: context),
                    ),
                    SizedBox(
                      height: 35 * widthScaleF2F(context: context),
                    ),
                    CustomButton(
                      highlightTextColor: const Color.fromRGBO(47, 47, 170, 1),
                      highlightBgColor: Colors.white,
                      smallButton: true,
                      onPressed: () {
                        GoRouter.of(context).pushNamed('detailedJobView');
                      },
                      textColor: textColorWhite,
                      highlightColor: const Color.fromRGBO(47, 47, 170, 1),
                      bgColor: const Color.fromRGBO(47, 47, 170, 1),
                      text: '\$61,000 per year',
                    ),
                    SizedBox(
                      height: 20 * widthScaleF2F(context: context),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  });
}

PopupMenuItem<int> getPopUpMenuItem(
    {required IconData iconData,
    required String text,
    required context,
    required int index}) {
  return PopupMenuItem<int>(
      value: 1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: textColorBlack,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: const TextStyle(
                color: textColorBlack,
                fontSize: 14,
                fontWeight: FontWeight.w600),
            textScaleFactor: textScaleF2F(context: context),
          ),
        ],
      ));
}

List jobCardsData = [
  {
    'jobTitle': 'Draftsperson with advanced  BIM Software',
    'employer': 'Insight BIM',
    'location': '20/330 Wattle St, Ultimo NSW 2007',
    'description':
        'Draftsperson with advanced understanding of BIM software with skills as a software developer...',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAAcXlIOIwRV8sWxU5swpc992QP742m4tUns1vXrsulw&usqp=CAU&ec=48600112'
  },
  {
    'jobTitle': 'Draftsperson with advanced  BIM Software',
    'employer': 'Insight BIM',
    'location': '20/330 Wattle St, Ultimo NSW 2007',
    'description':
        'Draftsperson with advanced understanding of BIM software with skills as a software developer...',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAAcXlIOIwRV8sWxU5swpc992QP742m4tUns1vXrsulw&usqp=CAU&ec=48600112'
  },
  {
    'jobTitle': 'Draftsperson with advanced  BIM Software',
    'employer': 'Insight BIM',
    'location': '20/330 Wattle St, Ultimo NSW 2007',
    'description':
        'Draftsperson with advanced understanding of BIM software with skills as a software developer...',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAAcXlIOIwRV8sWxU5swpc992QP742m4tUns1vXrsulw&usqp=CAU&ec=48600112'
  },
];
