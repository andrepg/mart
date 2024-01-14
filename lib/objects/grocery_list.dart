import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcado/libraries/db_handler.dart';
import 'package:smartcado/libraries/providers/grocery_list_provider.dart';
import 'package:smartcado/objects/model.dart';
import 'package:smartcado/schemas/grocery_list_schema.dart';

import 'grocery_item.dart';

class GroceryList implements Model {
  int? id;
  String uuid = UniqueKey().toString();
  String title;
  bool archived;

  List<GroceryItem> items = List.empty();

  /// Create new object with basic information
  GroceryList({
    required this.title,
    this.archived = false,
  });

  /// Set our Grocery List as archived
  void changeArchivedState() => archived = !archived;

  @override
  Map<String, dynamic> toMap() => {
        GroceryListSchema.id.name: id,
        GroceryListSchema.uuid.name: uuid,
        GroceryListSchema.title.name: title,
        GroceryListSchema.archived.name: archived ? 1 : 0,
      };

  Future<int> store() async =>
      GroceryListProvider(await DatabaseHandler().getDatabase())
          .saveSingleResource(this);
}
