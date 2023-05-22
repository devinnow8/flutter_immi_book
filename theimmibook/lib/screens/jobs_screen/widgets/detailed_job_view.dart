import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theimmibook/screens/home_screen/widgets/jobs.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/customButton/customButton.dart';

class DetailedJobView extends StatefulWidget {
  const DetailedJobView({super.key});

  @override
  State<DetailedJobView> createState() => _DetailedJobViewState();
}

class _DetailedJobViewState extends State<DetailedJobView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: getSubsectionWidth(context)),
        child: Column(
          children: [
            getDetailedJobHeader(context),
            const SizedBox(
              height: 120,
            ),
            getDetailedJobBody()
          ],
        ),
      ),
    );
  }
}

Widget getDetailedJobHeader(context) {
  String title = jobCardsData[0]['jobTitle'];
  String employer = jobCardsData[0]['employer'];
  String description = jobCardsData[0]['description'];
  String imageUrl = jobCardsData[0]['imageUrl'];
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: 60 * widthScaleF2F(context: context), vertical: 24),
    decoration: const BoxDecoration(color: Colors.amber, boxShadow: [
      BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 12)
    ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'IBM',
              style: TextStyle(color: Colors.black),
            ),
            Container(
              height: 100,
              width: 100,
              color: bodyColorBlue,
            )
          ],
        ),
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
            ]),
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
        customButton(
          highlightTextColor: const Color.fromRGBO(47, 47, 170, 1),
          highlightBgColor: Colors.white,
          smallButton: true,
          onPressed: () {},
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
  );
}

Widget getDetailedJobBody() {
  return Container(
    decoration: const BoxDecoration(
        color: Color.fromARGB(255, 7, 119, 255),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 2, blurRadius: 12)
        ]),
    height: 150,
    child: Row(),
  );
}
