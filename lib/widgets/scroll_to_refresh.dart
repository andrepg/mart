import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollToRefresh extends StatefulWidget {
  final Widget child;
  final Future refreshFunction;

  const ScrollToRefresh({
    super.key,
    required this.refreshFunction,
    required this.child,
  });

  @override
  State createState() => _ScrollToRefreshState();
}

class _ScrollToRefreshState extends State<ScrollToRefresh> {
  final GlobalKey _globalKey = GlobalKey<_ScrollToRefreshState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _globalKey,
      onRefresh: () => widget.refreshFunction,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: widget.child,
      ),
    );
  }
}
