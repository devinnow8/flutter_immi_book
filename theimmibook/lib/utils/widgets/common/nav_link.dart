import 'package:flutter/material.dart';

class NavLink extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final dynamic onClick;
  final List options;
  const NavLink(
      {super.key,
      required this.text,
      required this.onClick,
      required this.style,
      this.options = const []});

  @override
  State<NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<NavLink> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick(),
      child: MouseRegion(
          onExit: (_) {
            hover = false;
            setState(() {});
          },
          onEnter: (_) {
            hover = true;
            setState(() {});
          },
          cursor: SystemMouseCursors.click,
          child: Text(
            widget.text,
            style: hover == true
                ? widget.style!
                    .merge(const TextStyle(fontWeight: FontWeight.w600))
                : widget.style,
          )),
    );
  }
}
