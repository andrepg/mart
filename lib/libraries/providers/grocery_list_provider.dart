import 'package:smartcado/libraries/persistence_interface.dart';
import 'package:smartcado/schemas/grocery_list_schema.dart';
import 'package:sqflite/sqflite.dart';

class GroceryListProvider implements Persistence {
  final Database _databaseInstance;
  final String _table = "grocery_lists";

  @override
  loadCollectionResource(List<int> ids) {
    // TODO: implement loadCollectionResource
    throw UnimplementedError();
  }

  @override
  loadSingleResource(String groceryId) {
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
  saveCollectionResource(List<Object> groceryList) {
    // TODO: implement saveCollectionResource
    throw UnimplementedError();
  }

  @override
  Future<int> saveSingleResource(Map<String, Object?> grocery) async {
    return _databaseInstance.insert(_table, grocery,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  GroceryListProvider(this._databaseInstance);
}
