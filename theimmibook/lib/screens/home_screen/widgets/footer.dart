import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context: context),
      color: const Color.fromRGBO(0, 10, 78, 1),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: getSubsectionWidth(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'immibookTitle'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: accentColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height:
                isMobile(context) ? 60 * widthScaleF2F(context: context) : 60,
          ),
       
          ConstrainedBox(
            constraints: BoxConstraints(
                  maxWidth: getSubsectionWidth(context)),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Flex(
                    direction:
                        isMobile(context) ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectableText(
                        'postsTitle'.tr,
                        textScaleFactor: textScaleF2F(context: context),
                      ),
                      Text(
                        'jobs'.tr,
                        textScaleFactor: textScaleF2F(context: context),
                      ),
                      Text(
                        'accommodations'.tr,
                        textScaleFactor: textScaleF2F(context: context),
                      ),
                      Text(
                        'events'.tr,
                        textScaleFactor: textScaleF2F(context: context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context)),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('twitterIcon.svg'),
                        SvgPicture.asset('youtubeIcon.svg'),
                        SvgPicture.asset('tiktokIcon.svg'),
                        SvgPicture.asset('instagramIcon.svg'),
                        SvgPicture.asset('mailIcon.svg'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
