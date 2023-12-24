import 'grocery_item.dart';

class GroceryList {
  final String title;
  // Set default values to our object
  bool archived = false;
  double amountEstimated = 0;

  List<GroceryItem> items = List.empty();

  GroceryList({required this.title});

  void archive() => archived = true;
}
