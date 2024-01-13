import 'package:flutter/material.dart';

class NewGroceryListScreen extends StatefulWidget {
  const NewGroceryListScreen({super.key});

  @override
  State<NewGroceryListScreen> createState() => _NewGroceryListScreenState();
}

class _NewGroceryListScreenState extends State<NewGroceryListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          key: UniqueKey(),
          title: const Text("New grocery list"),
          centerTitle: false,
          leading: IconButton(
            onPressed: () => _returnToPreviousPage(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Form(
            child: ListView(
              children: [
                const Text("What is your groceries list's name?"),

                TextFormField(
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  autofocus: true,
                  maxLength: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() =>
      FloatingActionButton.extended(
        key: UniqueKey(),
        heroTag: "MainFloatingActionButton",
        enableFeedback: true,
        tooltip: "Save grocery list",
        onPressed: null,
        icon: const Icon(Icons.save),
        label: const Text("Save grocery list"),
      );

  _returnToPreviousPage() => Navigator.pop(context);
}
