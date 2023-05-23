import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:theimmibook/screens/home_screen/widgets/footer.dart';
import 'package:theimmibook/utils/widgets/app_bar/appbar.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class DetailedViewHolder extends StatefulWidget {
  const DetailedViewHolder(
      {super.key, required this.body, this.showStickyRibbon = false});
  final Widget body;
final bool showStickyRibbon;
  @override
  State<DetailedViewHolder> createState() => _DetailedViewHolderState();
}

class _DetailedViewHolderState extends State<DetailedViewHolder> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ScrollbarTheme(
            data: ScrollbarThemeData(
                trackColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 239, 239, 239),
                ),
                thumbColor:
                    MaterialStateColor.resolveWith((states) => Colors.grey)),
            child: Scrollbar(
              trackVisibility:
                  getScreenWidth(context: context) < mobileWidth ? false : true,
              thickness:
                  getScreenWidth(context: context) < mobileWidth ? 2 : 10,
              hoverThickness:
                  getScreenWidth(context: context) < mobileWidth ? 3 : 10,
              controller: _scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      0,
                      getScreenWidth(context: context) < mobileWidth
                          ? 0
                          : scrollbarThickness,
                      0),
                  child: Column(
                    children: [
                      Container(
                          color: const Color.fromRGBO(19, 19, 63, 1),
                          margin: const EdgeInsets.symmetric(vertical: 0),
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: const MyAppBar()),
                      const SizedBox(
                        height: 30,
                      ),
                      widget.body,
                      const Footer()
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (widget.showStickyRibbon)
            Positioned(
              left: 0,
              child: Container(
                color: bodyColorBlue,
                height: 65,
                alignment: Alignment.center,
                width: getMaxNetWidth(context),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: getSubsectionWidth(context) * 0.85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              'applyNow',
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    40 * widthScaleF2F(context: context),
                                vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'locationArrow.svg',
                                  height: 15,
                                  color: bodyColorBlue,
                                  fit: BoxFit.fitHeight,
                                ),
                                SizedBox(
                                  width: 15 * widthScaleF2F(context: context),
                                ),
                                Text(
                                  'Quick Apply',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22,
                                      color: bodyColorBlue),
                                  textScaleFactor:
                                      textScaleF2F(context: context) * 0.85,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (isMobile(context))
                        SizedBox(
                          width: getHorizontalPadding(context),
                        )
                    ],
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}















      // Container(
      //       color: const Color.fromRGBO(19, 19, 63, 1),
      //       height: 65,
      //       alignment: Alignment.center,
      //       width: getScreenWidth(context: context),
      //       child: ConstrainedBox(
      //         constraints:
      //             BoxConstraints(maxWidth: getSubsectionWidth(context) * 0.85),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             MouseRegion(
      //               cursor: SystemMouseCursors.click,
      //               child: Container(
      //                 padding: EdgeInsets.symmetric(
      //                     horizontal: 40 * widthScaleF2F(context: context),
      //                     vertical: 10),
      //                 decoration: BoxDecoration(
      //                     color: bodyColorBlue,
      //                     borderRadius: BorderRadius.circular(8)),
      //                 child: Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                     SvgPicture.asset(
      //                       'locationArrow.svg',
      //                       height: 15,
      //                       color: textColorWhite,
      //                       fit: BoxFit.fitHeight,
      //                     ),
      //                     SizedBox(
      //                       width: 15 * widthScaleF2F(context: context),
      //                     ),
      //                     Text(
      //                       'Quick Apply',
      //                       style: const TextStyle(fontSize: 22),
      //                       textScaleFactor:
      //                           textScaleF2F(context: context) * 0.85,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             if (isMobile(context))
      //               SizedBox(
      //                 width: getHorizontalPadding(context),
      //               )
      //           ],
      //         ),
      //       ),
      //     ),