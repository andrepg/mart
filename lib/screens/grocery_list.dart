import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => const ListTile(
            title: Text("List Title"),
          ),
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() => FloatingActionButton(
        key: const Key("mainFloatingButton"),
        enableFeedback: true,
        tooltip: "Add new grocery list",
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart),
      );

  AppBar _buildAppBar() => AppBar(
        title: const Text("Mart!"),
        centerTitle: true,
        leading: Icon(
          Icons.shopping_cart,
          color: Theme.of(context).primaryColor,
          size: 36,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      );
}
