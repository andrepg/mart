import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcado/objects/model.dart';
import 'package:smartcado/schemas/grocery_list_schema.dart';

import 'grocery_item.dart';

class GroceryList implements Model {
  int? id;
  String uuid = UniqueKey().toString();
  String title;
  bool archived = false;

  List<GroceryItem> items = List.empty(growable: true);

  GroceryList({required this.title});

  factory GroceryList.fromMap(Map<String, dynamic> map) {
    var groceryList = GroceryList(title: map['title']);

    groceryList.id = map['id'];
    groceryList.uuid = map['uuid'] ?? UniqueKey().toString();
    groceryList.archived = map['archived'] == 1;

    return groceryList;
  }

  changeArchivedState() => archived = !archived;

  @override
  Map<String, dynamic> toMap() => {
        GroceryListSchema.id.name: id,
        GroceryListSchema.uuid.name: uuid,
        GroceryListSchema.title.name: title,
        GroceryListSchema.archived.name: archived ? 1 : 0,
      };
}
