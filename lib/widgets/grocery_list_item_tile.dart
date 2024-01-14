import 'package:flutter/material.dart';
import 'package:smartcado/objects/grocery_item.dart';

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
      isThreeLine: true,
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Qtd. ${widget.groceryItem.quantity} | "
              "Prc. ${widget.groceryItem.price}"),
          Text("Total ${_getTotalPriceItem()}")
        ],
      ),
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

  _getTotalPriceItem() =>
      (widget.groceryItem.price * widget.groceryItem.quantity);
}
