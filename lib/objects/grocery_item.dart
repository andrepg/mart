import 'package:smartcado/objects/model.dart';

class GroceryItem implements Model {
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

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
