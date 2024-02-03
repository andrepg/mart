import 'package:flutter/widgets.dart';
import 'package:smartcado/database/grocery_list_schema.dart';
import 'package:smartcado/objects/model.dart';

class GroceryList implements Model {
  int? id;
  String? uuid;
  String title;
  bool archived = false;

  GroceryList({
    required this.title,
    this.id,
    this.uuid,
    this.archived = false,
  });

  factory GroceryList.fromMap(Map<String, dynamic> map) => GroceryList(
      id: map[GroceryListSchema.id.name],
      title: map[GroceryListSchema.title.name],
      uuid: map[GroceryListSchema.uuid.name],
      archived: map[GroceryListSchema.archived.name] == 1);

  toggleArchivedState() => archived = !archived;

  @override
  Map<String, dynamic> toMap() => Map.from({
        GroceryListSchema.id.name: id,
        GroceryListSchema.uuid.name: uuid ?? UniqueKey().toString(),
        GroceryListSchema.title.name: title,
        GroceryListSchema.archived.name: archived ? 1 : 0
      });
}
