class GroceryItem {
  String name;
  double quantity;
  double price;
  bool onCart;

  GroceryItem({
    required this.name,
    required this.quantity,
    required this.price,
    this.onCart = false,
  });
}
