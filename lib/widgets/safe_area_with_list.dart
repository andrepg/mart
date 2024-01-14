import 'package:flutter/material.dart';

import 'scroll_to_refresh.dart';

class SafeAreaWithList extends StatelessWidget {
  final Widget? floatingActionButton;
  final PreferredSizeWidget? screenAppBar;
  final List<dynamic> listContent;
  final NullableIndexedWidgetBuilder tileBuilder;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const SafeAreaWithList({
    super.key,
    required this.listContent,
    required this.tileBuilder,
    this.screenAppBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: screenAppBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          body: ScrollToRefresh(
            refreshFunction: Future.value(true),
            child: ListView.builder(
              itemCount: listContent.length,
              itemBuilder: tileBuilder,
            ),
          ),
        ),
      );
}
