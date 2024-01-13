import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcado/objects/model.dart';
import 'package:smartcado/schemas/grocery_list_schema.dart';
import 'grocery_item.dart';

class GroceryList implements Model {
  late int id;
  String uuid = UniqueKey().toString();
  String title;
  bool archived = false;

  List<GroceryItem> items = List.empty();

  /// Create new object with basic information
  GroceryList({required this.title});

  /// Set our Grocery List as archived
  void changeArchivedState() => archived = !archived;


  @override
  Map<String, dynamic> toMap() => {
    GroceryListSchema.id.name: id,
    GroceryListSchema.uuid.name: uuid,
    GroceryListSchema.title.name: title,
    GroceryListSchema.archived.name: archived ? 1 : 0,
  };
}
