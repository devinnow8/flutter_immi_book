import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getMaxNetWidth(context),
      alignment: Alignment.center,
      color: bodyBgSecondaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: getSubsectionWidth(context)),
              child: getHeadingAndOptions(
                  context: context,
                  title: 'eventsTitle'.tr,
                  options: Text(
                    'viewMore'.tr,
                    style: sectionHeadingOptionsStyle,
                    textScaleFactor: textScaleF2F(context: context),
                  )),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
            child: Container(
              alignment: Alignment.center,
              constraints:
                  BoxConstraints(maxWidth: getSubsectionWidth(context)),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 30,
                runSpacing: 30,
                children: [
                  if (isMobile(context))
                    ...eventCardsData.map((e) => eventCard(e['id'], context)),
                  if (getMaxNetWidth(context) <= 1570 && !isMobile(context))
                    ...eventCardsData
                        .sublist(0, 2)
                        .map((e) => eventCard(e['id'], context)),
                  if (getMaxNetWidth(context) > 1570)
                    ...eventCardsData.map((e) => eventCard(e['id'], context))
                ],
              ),
              
            ),
          ),
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}

var expandId = 0.obs;

Widget eventCard(int i, context) {
  String title = eventCardsData[0]['title'];
  String subTitle = eventCardsData[0]['subTitle'];
  String date = eventCardsData[0]['date'];
  String imageUrl = eventCardsData[0]['imageUrl'];
double width = isMobile(context)
      ? double.maxFinite
      : (getMaxNetWidth(context) < 1570
          ? getSubsectionWidth(context) / 2.2
          : getSubsectionWidth(context) / 2.7);
  //cardWidth = (expandId.value == i) ? 500 : 356;
  return StatefulBuilder(builder: (context, setState) {
     
      return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      onEnter: (_) {
        expandId.value = i;
      },
      onExit: (_) {
        expandId.value = 0;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width:
                expandId.value == i || isMobile(context) ? width : width - 144,
            height:
                isMobile(context) ? 900 * widthScaleF2F(context: context) : 500,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 19, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: double.infinity,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
       
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(fontSize: 25),
                            textScaleFactor: textScaleF2F(context: context),
                          ),
                          SizedBox(
                            height: 6 * widthScaleF2F(context: context),
                          ),
                          Text(
                            subTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            textScaleFactor: textScaleF2F(context: context),
                          ),
                          SizedBox(
                            height: 8 * widthScaleF2F(context: context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.av_timer_sharp,
                                    color: highlightColor,
                                    size: isMobile(context)
                                        ? 20 * textScaleF2F(context: context)
                                        : 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    date,
                                    style: const TextStyle(fontSize: 16),
                                    textScaleFactor:
                                        textScaleF2F(context: context),
                                  ),
                                ],
                              ),
                              if (expandId.value == i)
                                Icon(
                                  Icons.arrow_right_alt_outlined,
                                  size: isMobile(context)
                                      ? 45 * textScaleF2F(context: context)
                                      : 45,
                                  color: highlightColor,
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      );
  });
}

List eventCardsData = [
  {
    'id': 0,
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'date': '03-08-2023',
    'imageUrl':
        'https://previews.123rf.com/images/lightfieldstudios/lightfieldstudios1705/lightfieldstudios170508267/79317215-singer-with-rock-and-roll-band-performing-music-on-stage.jpg'
  },
  {
    'id': 1,
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'date': '03-08-2023',
    'imageUrl':
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.wallpaperflare.com%2Flive-show-band-performing-on-stage-concert-musicians-lights-wallpaper-zplnh&psig=AOvVaw3YuELYV-QKc6UfXu3MsBIP&ust=1683958107533000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMDpkPmO7_4CFQAAAAAdAAAAABAI'
  },
  {
    'id': 2,
    'title': 'Your personal guide in new country',
    'subTitle': 'Feel free to explorer',
    'date': '03-08-2023',
    'imageUrl':
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.wallpaperflare.com%2Flive-show-band-performing-on-stage-concert-musicians-lights-wallpaper-zplnh&psig=AOvVaw3YuELYV-QKc6UfXu3MsBIP&ust=1683958107533000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMDpkPmO7_4CFQAAAAAdAAAAABAI'
  }
];
