import "./models/grocery_list_test.dart" as grocery_list_model;
import './providers/grocery_list_persistence_test.dart' as grocery_list_provider;
import './services/grocery_service_test.dart' as grocery_list_service;

void main() async {
  grocery_list_model.main();
  grocery_list_provider.main();
  grocery_list_service.main();
}
