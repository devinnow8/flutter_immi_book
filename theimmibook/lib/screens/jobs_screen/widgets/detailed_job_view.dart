import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theimmibook/screens/home_screen/widgets/jobs.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';
import 'package:theimmibook/utils/widgets/common/custom_child_button.dart';

class DetailedJobView extends StatefulWidget {
  const DetailedJobView({super.key});

  @override
  State<DetailedJobView> createState() => _DetailedJobViewState();
}

class _DetailedJobViewState extends State<DetailedJobView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
            child: getDetailedJobHeader(context)),
        const SizedBox(
          height: 50,
        ),

        const SizedBox(
          height: 50,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
          child: getDetailedJobBody(context),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}

Widget getDetailedJobHeader(context) {
  String title = jobCardsData[0]['jobTitle'];
  String employer = jobCardsData[0]['employer'];
  String description = jobCardsData[0]['description'];
  String imageUrl = jobCardsData[0]['imageUrl'];
  return Container(
    constraints: BoxConstraints(maxWidth: getSubsectionWidth(context)) * 0.85,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'IBM',
              style: const TextStyle(fontSize: 60, color: Colors.black),
              textScaleFactor: textScaleF2F(context: context),
            ),
            CustomChildButton(
                bgColor: textColorWhite,
                fgColor: bodyColorBlue,
                onPressed: () {},
                iconData: Icons.bookmark_border_outlined,
                text: 'Save')
          ],
        ),
        SizedBox(
          height: 15 * widthScaleF2F(context: context),
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
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: textColorBlack,
                  ),
                  textScaleFactor: textScaleF2F(context: context),
                ),
              ),
            ]),

        SizedBox(
          height: 30 * widthScaleF2F(context: context),
        ),
        Text(
          employer,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: bodyColorBlue,
          ),
          textScaleFactor: textScaleF2F(context: context),
        ),
        SizedBox(
          height: 15 * widthScaleF2F(context: context),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'locationPin.svg',
              fit: BoxFit.fitHeight,
              height: 15,
              color: Color.fromRGBO(15, 15, 109, 1),
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
                color: Color.fromRGBO(15, 15, 109, 1),
              ),
              textScaleFactor: textScaleF2F(context: context),
            ),
          ],
        ),
        SizedBox(
          height: 15 * widthScaleF2F(context: context),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.av_timer_sharp,
              color: Color.fromRGBO(136, 136, 136, 1),
              size: 18,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              'Posted on 16 Apr, 2023',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(136, 136, 136, 1),
              ),
              textScaleFactor: textScaleF2F(context: context),
            ),
          ],
        ),
        SizedBox(
          height: 25 * widthScaleF2F(context: context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              CupertinoIcons.briefcase,
              color: bodyColorBlue,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Job Type',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textColorBlack,
              ),
              textScaleFactor: textScaleF2F(context: context),
            ),
          ],
        ),
        SizedBox(
          height: 20 * widthScaleF2F(context: context),
        ),
        Row(
          children: [
            getBadge(
                bgColor: bodyBgSecondaryColor,
                text: 'Full Time',
                context: context,
                fgColor: textColorBlack),
            const SizedBox(
              width: 8,
            ),
            getBadge(
                bgColor: const Color.fromRGBO(242, 242, 242, 1),
                text: 'Part Time',
                context: context,
                fgColor: textColorBlack)
          ],
        ),
        SizedBox(
          height: 30 * widthScaleF2F(context: context),
        ),
        Row(
          children: [
            SvgPicture.asset(
              'dollar.svg',
              fit: BoxFit.fitHeight,
              height: 22,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '61,000 per year',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(15, 15, 109, 1),
              ),
              textScaleFactor: textScaleF2F(context: context),
            ),
          ],
        ),
        SizedBox(
          height: 20 * widthScaleF2F(context: context),
        ),
      ],
    ),
  );
}

Widget getDetailedJobBody(context) {
  String title = jobCardsData[0]['jobTitle'];
  String employer = jobCardsData[0]['employer'];
  String description = jobCardsData[0]['description'];
  String imageUrl = jobCardsData[0]['imageUrl'];
  return Container(
    constraints: BoxConstraints(maxWidth: getSubsectionWidth(context)) * 0.85,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35 * widthScaleF2F(context: context),
        ),
        getJobDescriptionTitle('Job Description', context),
     
        Text(
          jobDescriptionSample,
          style: const TextStyle(
              height: 2.6,
              fontSize: 14,
              color: textColorBlack,
              fontWeight: FontWeight.w400),
          textScaleFactor: textScaleF2F(context: context),
        ),
        SizedBox(
          height: 35 * widthScaleF2F(context: context),
        ),
        getJobDescriptionTitle(
            'As the successful applicant, this role will see your responsibilities include:',
            context),
        ...responsibilities.split('\n').map((e) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'checkMark.svg',
                  height: 12,
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    e,
                    style: const TextStyle(
                        height: 2.2,
                        fontSize: 14,
                        color: textColorBlack,
                        fontWeight: FontWeight.w400),
                    textScaleFactor: textScaleF2F(context: context),
                  ),
                ),
              ],
            )),
  
        SizedBox(
          height: 35 * widthScaleF2F(context: context),
        ),
        getJobDescriptionTitle('About Frasers Property in Australia:', context),
        Text(
          about,
          style: const TextStyle(
              height: 2.6,
              fontSize: 14,
              color: textColorBlack,
              fontWeight: FontWeight.w400),
          textScaleFactor: textScaleF2F(context: context),
        ),

        SizedBox(
          height: 20 * widthScaleF2F(context: context),
        ),
      ],
    ),
  );
}

Widget getBadge(
    {required bgColor, required text, required context, required fgColor}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    decoration:
        BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
    child: Text(
      text,
      style: TextStyle(
        color: fgColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      textScaleFactor: textScaleF2F(context: context),
    ),
  );
}

Widget getJobDescriptionTitle(String text, context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        text,
        style: const TextStyle(
            fontSize: 22,
            color: Color.fromRGBO(15, 15, 109, 1),
            fontWeight: FontWeight.w800),
        textScaleFactor: textScaleF2F(context: context),
      ),
      SizedBox(
        height: 25 * widthScaleF2F(context: context),
      ),
    ],
  );
}





String jobDescriptionSample =
    '''Due to internal promotion, our residential line of business is seeking an enthusiastic Assistant Development Manager to join our team based at our brand-new Brisbane office. As an active member of our development team, the ADM will be working on our ground breaking Build To Rent project in Fortitude Valley along with our luxury residential project, Hamilton Reach. This role is a highly visible position with exposure to external and internal stakeholders and works closely with senior management to deliver our exciting new Build to Rent development.

The ADM will report to the Development Director while working alongside the Senior Development Manager to optimise margin and protect FPA from commercial risk from project concept right through to project close out. They will strive to work collaboratively with the team to ensure that Company’s expectations on safety, cost, time, quality, and customer service are met.

Our team offers a positive, supportive environment – plus plenty of great benefits to help you develop both professionally and personally.''';

String responsibilities =
    '''Conduct regular site visits to address safety, quality, costs, design issues etc.
Work with the Senior Development Manager & Director to manage the execution of the Project Vision
Coordinate Quarterly Development Reports as required under the Queensland Governments Build to Rent Pilot Project
Preparation of development forecasts, monitor and manage project revenue and costs in line with budgets
Explore and implement environmentally sustainable design initiatives.
Assisting with preparing development legal documents
Supporting and coordinating the contributions of the marketing, sales, leasing, and financing teams
Assist with the preparation of regular presentations and relevant development forecast reporting
Promote a “Customer First” culture and ensure customer expectations are met
Liaise with the construction/finance/project management teams during construction management stage
Prepare and ensure planning and development approvals are achieved in accordance with feasibility timeframes and the Project Vision''';

String about =
    '''International in scale but local at heart, we work on innovative, sustainable projects which contribute to stronger, smarter, happier neighbourhoods. Our Australian platform leverages the strength, expertise and opportunities of Frasers Property Limited, a multi-national real estate company which develops, owns and manages a diverse portfolio of properties across five asset classes, with operations in 70 cities across 20 countries.

The Frasers Property culture focuses on inclusion and equity, performance excellence, team collaboration, and developing and supporting our people. We’re recognised as an Employer of Choice for Gender Equality by the Australian Government’s Workplace Gender Equality Agency, and we are a White Ribbon Accredited workplace.

The Australian platform of the multi-national Frasers Property Limited encompasses Frasers Property Australia and Frasers Property Industrial. Together, we provide innovative solutions across the property value chain. Our legacy as a leading multi-sector developer spans nearly 100 years in Australia and we have over 500 staff across our Australian businesses.

Our sectors of operation include residential land, housing and apartments; build-to-rent; commercial; retail; mixed-use; energy; sustainability; industrial and logistics; corporate parks; hotels and serviced apartments. Our activities also encompass the ownership and management of investment property, incorporating property and asset management services.

Please check out our website at https://www.hcf.com.au/about-us/careers''';
