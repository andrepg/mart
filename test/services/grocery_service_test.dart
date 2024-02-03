import 'package:flutter_test/flutter_test.dart';
import 'package:smartcado/services/grocery_service.dart';

void main() async {
  group('test grocery service', () {
    test('create service correctly', () {
      var service = GroceryListService.instance;

      expect(service, isA<GroceryListService>());
      markTestSkipped("Still missing test design");
    });
  });
}
