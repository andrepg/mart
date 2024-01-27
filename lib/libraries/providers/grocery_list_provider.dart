import 'package:smartcado/libraries/persistence_interface.dart';
import 'package:smartcado/objects/grocery_list.dart';
import 'package:smartcado/schemas/grocery_list_schema.dart';
import 'package:sqflite/sqflite.dart';

class GroceryListProvider implements Persistence {
  final String _table = "grocery_lists";
  late Database _databaseInstance;

  @override
  Future loadCollectionResource(List<int>? ids) {
    if (ids != null) {
      return _databaseInstance.query(_table,
          columns: [
            GroceryListSchema.id.name,
            GroceryListSchema.title.name,
            GroceryListSchema.archived.name,
          ],
          where: "${GroceryListSchema.id.name} IN (?)",
          whereArgs: [ids.join(",").toString()]);
    }

    return _databaseInstance.query(_table, columns: [
      GroceryListSchema.id.name,
      GroceryListSchema.title.name,
      GroceryListSchema.archived.name,
    ]);
  }

  @override
  Future loadSingleResource(String groceryId) {
    return _databaseInstance.query(_table,
        columns: [
          GroceryListSchema.id.name,
          GroceryListSchema.title.name,
          GroceryListSchema.archived.name,
        ],
        where: "${GroceryListSchema.id.name} = ? "
            "or ${GroceryListSchema.uuid.name} = ?",
        whereArgs: [
          groceryId,
          groceryId,
        ]);
  }

  @override
  Future saveCollectionResource(List listOfGroceryList) {
    if (listOfGroceryList.isEmpty) {
      return Future.value(false);
    }

    return _databaseInstance.transaction((transactionObject) async {
      for (GroceryList groceryList in listOfGroceryList) {
        transactionObject.insert(
          _table,
          groceryList.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  @override
  Future<int> saveSingleResource(Map<String, Object?> grocery) async {
    return _databaseInstance.insert(_table, grocery,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  GroceryListProvider._privateConstructor();

  initialize(Database db) => _databaseInstance = db;

  static final GroceryListProvider instance =
      GroceryListProvider._privateConstructor();
}
