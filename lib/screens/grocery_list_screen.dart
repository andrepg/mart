import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartcado/widgets/modal_grocery_list_create.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your groceries",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showModalBottomSheet,
        label: const Text("Create new grocery list"),
        icon: const Icon(Icons.add_shopping_cart_rounded),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
        child: FutureBuilder(
          future: Future.value(false),
          builder: (context, snapshot) {
            return Container();
          },
        ),

        // RefreshIndicator(
        //   onRefresh: () => _refreshGroceryLists(),
        //   child:
        //   ListView.builder(
        //     itemCount: _groceryLists.length,
        //     itemBuilder: (context, index) => GroceryListTile(
        //       groceryList: _groceryLists.elementAt(index),
        //     ),
        //     physics: const AlwaysScrollableScrollPhysics(),
        //   ),
        // ),
      ),
    );
  }

  _showModalBottomSheet() => showModalBottomSheet(
        context: context,
        enableDrag: true,
        showDragHandle: true,
        useSafeArea: true,
        builder: (context) => const ModalGroceryListCreate(),
      );

  Future _updateGroceryLists() async {}
}
