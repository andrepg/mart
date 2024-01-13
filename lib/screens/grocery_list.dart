import 'package:flutter/material.dart';
import 'package:smartcado/objects/grocery_list.dart';
import 'package:smartcado/widgets/grocery_list_item.dart';
import 'package:smartcado/widgets/mart_appbar.dart';
import 'package:smartcado/widgets/scroll_to_refresh.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  List<GroceryList> groceries = List.from([
    GroceryList(title: "Grocery list 1"),
    GroceryList(title: "Grocery list 2"),
    GroceryList(title: "Grocery list 3"),
    GroceryList(title: "Grocery list 4"),
    GroceryList(title: "Grocery list 5"),
    GroceryList(title: "Grocery list 6"),
    GroceryList(title: "Grocery list 7"),
    GroceryList(title: "Grocery list 8"),
    GroceryList(title: "Grocery list 9"),
  ]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MartAppBar(appBar: AppBar()),
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ScrollToRefresh(
          refreshFunction: Future.value(true),
          child: ListView.builder(
            itemCount: groceries.length,
            itemBuilder: (context, index) =>
                GroceryListTile(groceryList: groceries.elementAt(index)),
          ),
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() => FloatingActionButton(
        key: const Key("mainFloatingButton"),
        enableFeedback: true,
        tooltip: "Add new grocery list",
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart),
      );
}
