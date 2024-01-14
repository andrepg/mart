import 'package:flutter/material.dart';
import 'package:smartcado/objects/grocery_list.dart';
import 'package:smartcado/screens/grocery_list_new.dart';
import 'package:smartcado/widgets/grocery_list_item.dart';
import 'package:smartcado/widgets/mart_appbar.dart';
import 'package:smartcado/widgets/safe_area_with_list.dart';

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
  Widget build(BuildContext context) => SafeAreaWithList(
        screenAppBar: MartAppBar(appBar: AppBar()),
        listContent: groceries,
        tileBuilder: (context, index) =>
            GroceryListTile(groceryList: groceries[index]),
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );

  FloatingActionButton _buildFloatingActionButton() => FloatingActionButton(
        key: UniqueKey(),
        heroTag: "MainFloatingActionButton",
        enableFeedback: true,
        tooltip: "Add new grocery list",
        onPressed: () => _pushNewGroceryListScreen(),
        child: const Icon(Icons.add_shopping_cart_outlined),
      );

  Future<dynamic> _pushNewGroceryListScreen() => Navigator.push(context,
      MaterialPageRoute(builder: (context) => const NewGroceryListScreen()));
}
