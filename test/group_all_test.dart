import './libraries/providers/grocery_list_provider_test.dart'
    as provider_grocery_list;
import "./models/grocery_list_test.dart" as model_grocery_list;

void main() async {
  model_grocery_list.main();
  provider_grocery_list.main();
}
