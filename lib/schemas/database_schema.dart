import 'grocery_list_schema.dart';
import 'grocery_list_item_schema.dart';

abstract class DatabaseTables {
  static String groceryListItemsTable = "grocery_lists_items";
  static String groceryListTable = "grocery_lists";
}

final class DatabaseSchema {
  static final Map<String, String> _tableGroceryList = Map.unmodifiable({
    GroceryListSchema.id.name: "INTEGER PRIMARY KEY",
    GroceryListSchema.uuid.name: "TEXT",
    GroceryListSchema.title.name: "TEXT",
    GroceryListSchema.icon.name: "TEXT",
    GroceryListSchema.archived.name: "INTEGER",
    // This should be an array with IDs to search on grocery_list_items
    GroceryListSchema.items.name: "TEXT",
  });

  static final Map<String, String> _tableGroceryListItems = Map.unmodifiable({
    GroceryListItem.id.name: "INTEGER PRIMARY KEY",
    GroceryListItem.uuid.name: "TEXT",
    GroceryListItem.title.name: "TEXT",
    GroceryListItem.quantity.name: "REAL",
    GroceryListItem.price.name: "REAL",
    GroceryListItem.measurementUnit.name: "TEXT",
    GroceryListItem.onCart.name: "INTEGER",
  });

  static Map<String, Map> databaseSchema = Map.unmodifiable({
    DatabaseTables.groceryListTable: _tableGroceryList,
    DatabaseTables.groceryListItemsTable: _tableGroceryListItems,
  });
}
