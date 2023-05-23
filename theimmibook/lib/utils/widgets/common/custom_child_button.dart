import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theimmibook/utils/ui_utilities.dart';

class CustomChildButton extends StatefulWidget {
  const CustomChildButton(
      {super.key,
      required this.bgColor,
      required this.fgColor,
      required this.onPressed,
      required this.iconData,
      required this.text});

  final Color bgColor;
  final Color fgColor;
  final String text;
  final IconData iconData;
  final dynamic onPressed;

  @override
  State<CustomChildButton> createState() => _CustomChildButtonState();
}

class _CustomChildButtonState extends State<CustomChildButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() {
          _hover = true;
        }),
        onExit: (event) => setState(() {
          _hover = false;
        }),
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(
              horizontal: 25 * widthScaleF2F(context: context), vertical: 10),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.5 * widthScaleF2F(context: context),
                  color: widget.fgColor),
              color: _hover ? widget.fgColor : widget.bgColor,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.iconData,
                color: _hover ? widget.bgColor : widget.fgColor,
                size: 28 * textScaleF2F(context: context),
              ),
              SizedBox(
                width: 8 * widthScaleF2F(context: context),
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: _hover ? widget.bgColor : widget.fgColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 22),
                textScaleFactor: textScaleF2F(context: context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
