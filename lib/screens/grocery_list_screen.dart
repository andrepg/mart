import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  late List groceryLists;

  @override
  void initState() {
    super.initState();


  }

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
