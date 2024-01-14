import 'package:flutter/material.dart';
import 'package:smartcado/objects/grocery_item.dart';
import 'package:smartcado/screens/grocery_list_item.dart';

class GroceryListItemTile extends StatefulWidget {
  final GroceryItem groceryItem;
  final onTap;
  final onLongPress;

  const GroceryListItemTile({
    super.key,
    required this.groceryItem,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<GroceryListItemTile> createState() => _GroceryListItemTileState();
}

class _GroceryListItemTileState extends State<GroceryListItemTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.groceryItem.name),
      onLongPress: widget.onLongPress,
      subtitle: Text(widget.groceryItem.quantity.toString()),
      trailing: _buildTrailingButton(),
    );
  }

  IconButton _buildTrailingButton() {
    return IconButton(
      icon: Icon(_getCurrentIcon()),
      onPressed: () {
        // TODO Here we'll implement some type of call to repository@store()
        setState(() => widget.groceryItem.onCart = !widget.groceryItem.onCart);
      },
    );
  }

  IconData _getCurrentIcon() => widget.groceryItem.onCart
      ? Icons.shopping_cart_rounded
      : Icons.add_shopping_cart_rounded;
}
