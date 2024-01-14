import 'package:flutter/material.dart';
import 'package:smartcado/objects/grocery_list.dart';
import 'package:smartcado/screens/grocery_list_item.dart';

class GroceryListTile extends StatelessWidget {
  final GroceryList groceryList;
  final onTap;
  final onLongPress;

  const GroceryListTile({
    super.key,
    required this.groceryList,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryList.title),
      onLongPress: onLongPress,
      subtitle: Text(groceryList.uuid.toString()),
    );
  }
}
