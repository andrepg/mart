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
      leading: const Icon(Icons.shopping_basket_outlined),
      title: Text(groceryList.title),
      onTap: () {}, // TODO Include View GroceryList here
      onLongPress: () {}, // TODO Include contextual menu here
      subtitle: Text(groceryList.uuid.toString()),
    );
  }
}
