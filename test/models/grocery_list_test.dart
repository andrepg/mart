import 'package:flutter_test/flutter_test.dart';
import 'package:smartcado/objects/grocery_list.dart';

void main() {
  test('it creates a grocery list correctly', () {
    final groceryList = GroceryList(title: "Fruits");

    expect(groceryList.title, equals("Fruits"));
    expect(groceryList.archived, equals(false));
  });

  test('it archives a grocery list correctly', () {
    var groceryList = GroceryList(title: "Fruits");
    groceryList.toggleArchivedState();

    expect(groceryList.archived, equals(true));
  });

  test('it converts to map', () {
    var groceryList = GroceryList(title: "Fruits");
    final groceryMap = groceryList.toMap();

    expect(groceryMap, isMap);
    expect(groceryMap, containsPair("id", null));
    expect(groceryMap, containsPair("title", "Fruits"));
  });

  test('it converts from map', () {
    final groceryMap = {
      "id": 21,
      "uuid": "[#5a1f7]",
      "title": "Fruits",
      "archived": 0,
    };

    final groceryObject = GroceryList.fromMap(groceryMap);

    expect(groceryObject, isA<GroceryList>());
    expect(groceryObject.id, equals(groceryMap['id']));
    expect(groceryObject.uuid, equals(groceryMap['uuid']));
    expect(groceryObject.title, equals(groceryMap['title']));
    expect(groceryObject.archived, isFalse);
  });
}
