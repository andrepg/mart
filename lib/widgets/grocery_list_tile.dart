import 'package:flutter/material.dart';
import 'package:smartcado/objects/grocery_list.dart';

class GroceryListTile extends StatelessWidget {
  final GroceryList groceryList;

  const GroceryListTile({
    super.key,
    required this.groceryList,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryList.title),
      subtitle: Text(groceryList.uuid.toString()),
    );
  }
}
