import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theimmibook/screens/home_screen/widgets/footer.dart';
import 'package:theimmibook/utils/widgets/app_bar/appbar.dart';
import 'package:theimmibook/utils/consts.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class DetailedViewHolder extends StatefulWidget {
  const DetailedViewHolder({super.key, required this.body});
  final Widget body;

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
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: const MyAppBar()),
                      const SizedBox(
                        height: 50,
                      ),
                      widget.body,
                      const Footer()
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: (getScreenWidth(context: context) -
                    getSubsectionWidth(context))),
            color: const Color.fromRGBO(19, 19, 63, 1),
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 250),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                      color: bodyColorBlue,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.location_fill,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          'Quick Apply',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
