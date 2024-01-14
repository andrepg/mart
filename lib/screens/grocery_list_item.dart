import 'package:flutter/material.dart';
import 'package:smartcado/objects/grocery_item.dart';
import 'package:smartcado/objects/grocery_list.dart';
import 'package:smartcado/widgets/grocery_list_item_tile.dart';
import 'package:smartcado/widgets/safe_area_with_list.dart';

class GroceryItemListScreen extends StatefulWidget {
  final GroceryList groceryList;

  const GroceryItemListScreen({
    super.key,
    required this.groceryList,
  });

  @override
  State<GroceryItemListScreen> createState() => _GroceryItemListScreenState();
}

class _GroceryItemListScreenState extends State<GroceryItemListScreen> {
  final _bottomSheetController = DraggableScrollableController();

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: "Add new product to list",
          key: UniqueKey(),
          heroTag: "AddNewItemToGroceryListButton",
          child: const Icon(Icons.add_rounded),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomSheet: _buildBottomSheet(),
      );

  Widget? buildListTile(context, index) =>
      GroceryListItemTile(groceryItem: groceryItems.elementAt(index));

  PreferredSizeWidget? _buildScreenAppBar() => AppBar(
        key: UniqueKey(),
        title: Text(widget.groceryList.title),
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      );

  _buildBottomSheet() => DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(_calculateTotalList().toString(),
                    style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          );
        },
        expand: false,
        snap: true,
        minChildSize: 0.1,
        initialChildSize: 0.1,
        maxChildSize: 1,
        snapSizes: const [0.2, 1],
        controller: _bottomSheetController,
      );

  _calculateTotalList() => groceryItems.fold(
        0.0,
        (previousValue, groceryList) {
          if (!groceryList.onCart) {
            return previousValue;
          }

          return groceryList.price + previousValue;
        },
      );
}
