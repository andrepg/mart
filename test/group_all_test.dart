import "package:flutter_test/flutter_test.dart";

import './libraries/providers/grocery_list_provider_test.dart'
    as provider_grocery_list;
import "./models/grocery_list_test.dart" as model_grocery_list;

void main() {
  group('test model instances', () {
    model_grocery_list.main();
  });

  group('test service providers', () {
    provider_grocery_list.main();
  });
}
