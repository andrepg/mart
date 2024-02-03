import 'package:smartcado/persistence/grocery_list_persistence.dart';
import 'package:sqflite/sqflite.dart';

class GroceryListRepository {
  final GroceryListPersistence persistence;

  GroceryListRepository._privateConstructor({required this.persistence});

  static final GroceryListRepository instance =
      GroceryListRepository._privateConstructor(
          persistence: GroceryListPersistence.instance);

  Future initialize(Database db) async {
    persistence.initialize(db);
  }

  getAllLists() async {
    return await persistence.loadCollection(null);
  }
}
