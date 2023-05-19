import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/customButton/customButton.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
          child: Container(
            constraints: BoxConstraints(maxWidth: getSubsectionWidth(context)),
            child: getHeadingAndOptions(
              context: context,
              title: 'jobsTitle'.tr,
              options: Text(
                'viewAllJobs'.tr,
                style: sectionHeadingOptionsStyle,
                textScaleFactor: textScaleF2F(context: context),
              ),
            ),
          ),
        ),
        SizedBox(
          height:
              isMobile(context) ? 100 * widthScaleF2F(context: context) : 60,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: getSubsectionWidth(context), maxHeight: 900),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return jobCard();
            },
            itemCount: jobCardsData.length,
          ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 24),
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
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              customButton(
                                highlightTextColor:
                                    const Color.fromRGBO(47, 47, 170, 1),
                                highlightBgColor: Colors.white,
                                smallButton: true,
                                onPressed: () {},
                                textColor: textColorWhite,
                                highlightColor:
                                    const Color.fromRGBO(47, 47, 170, 1),
                                bgColor: const Color.fromRGBO(47, 47, 170, 1),
                                text: '\$61,000 per year',
                              ),
                              Text('|')
                            ],
                          ),
                          Text(
                            '24 hrs ago',
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
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  });
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
