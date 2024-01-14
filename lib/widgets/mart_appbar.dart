import 'package:flutter/material.dart';

class MartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const MartAppBar({super.key, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Mart!", style: Theme.of(context).textTheme.headlineMedium),
      centerTitle: true,
      leading: Icon(
        Icons.shopping_bag_outlined,
        color: Theme.of(context).primaryColor,
        size: 36,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: "App settings",
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
