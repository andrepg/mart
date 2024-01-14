import 'package:flutter/material.dart';
import 'package:smartcado/objects/grocery_item.dart';
import 'package:smartcado/widgets/grocery_list_item_tile.dart';
import 'package:smartcado/widgets/safe_area_with_list.dart';

class GroceryItemListScreen extends StatefulWidget {
  const GroceryItemListScreen({super.key});

  @override
  State<GroceryItemListScreen> createState() => _GroceryItemListScreenState();
}

class _GroceryItemListScreenState extends State<GroceryItemListScreen> {
  List<GroceryItem> groceryItems = List.from([
    GroceryItem(name: "My product 1", price: 2.24, quantity: 5, onCart: false),
    GroceryItem(name: "My product 2", price: 5.14, quantity: 2, onCart: true),
    GroceryItem(name: "My product 3", price: 7.64, quantity: 3, onCart: true),
    GroceryItem(name: "My product 4", price: 15.25, quantity: 1, onCart: false),
  ]);

  @override
  Widget build(BuildContext context) => SafeAreaWithList(
        screenAppBar: _buildScreenAppBar(),
        listContent: groceryItems,
        tileBuilder: buildListTile,
        floatingActionButton: null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );

  Widget? buildListTile(context, index) =>
      GroceryListItemTile(groceryItem: groceryItems.elementAt(index));

  PreferredSizeWidget? _buildScreenAppBar() => AppBar(
        key: UniqueKey(),
        title: const Text("@put_grocery_list_name"),
        centerTitle: false,
        leading: IconButton(
          onPressed: _returnToPreviousPage,
          icon: const Icon(Icons.arrow_back),
        ),
      );

  void _returnToPreviousPage() => Navigator.pop(context);
}
