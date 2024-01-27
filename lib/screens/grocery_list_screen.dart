import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  List groceryLists = List.empty();

  @override
  void initState() {
    super.initState();

    // _fetchAllGroceryLists();
  }

  // _fetchAllGroceryLists() async {
  //   GroceryListProvider provider = GroceryListProvider.instance;
  //   provider.initialize(await DatabaseHandler().getDatabase());
  //   provider.loadCollectionResource(null).then((value) => print(value));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.shop_2_outlined),
        title: const Text("Mart!"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: "Create new grocer list",
          child: const Icon(Icons.add_shopping_cart_rounded)),
      body: const Placeholder(),
    );
  }
}
