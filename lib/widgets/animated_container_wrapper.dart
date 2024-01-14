import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedContainerWrapper extends StatelessWidget {
  const AnimatedContainerWrapper({
    super.key,
    required this.openBuilder,
    required this.closedBuilder,
    required this.transitionType,
    required this.onClosed,
  });

  final Widget openBuilder;
  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      closedElevation: 0,
      transitionDuration: const Duration(milliseconds: 400),
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return openBuilder;
      },
      onClosed: onClosed,
      tappable: true,
      closedBuilder: closedBuilder,
    );
  }
}
