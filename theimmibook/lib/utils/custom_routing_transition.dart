import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage(
      {required BuildContext context,
      required GoRouterState state,
      required Widget child,
      required Duration duration,
      required String type}) {
    return CustomTransitionPage(
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case 'fade':
              return FadeTransition(opacity: animation, child: child);
            case 'rotation':
              return RotationTransition(turns: animation, child: child);
            case 'size':
              return SizeTransition(sizeFactor: animation, child: child);
            case 'scale':
              return ScaleTransition(scale: animation, child: child);
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }
}