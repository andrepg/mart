import 'package:flutter/material.dart';
import 'package:smartcado/objects/grocery_list.dart';

class NewGroceryListScreen extends StatefulWidget {
  const NewGroceryListScreen({super.key});

  @override
  State<NewGroceryListScreen> createState() => _NewGroceryListScreenState();
}

class _NewGroceryListScreenState extends State<NewGroceryListScreen> {
  final TextEditingController _editingControllerTitle = TextEditingController();
  var isSaving = false;

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
                  controller: _editingControllerTitle,
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

  GroceryList _mapFormToGroceryList() {
    return GroceryList(title: _editingControllerTitle.text);
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      key: UniqueKey(),
      heroTag: "MainFloatingActionButton",
      enableFeedback: true,
      tooltip: "Save grocery list",
      onPressed: () {
        setState(() => isSaving = true);
        _callSaveGroceryList().then((value) {
          setState(() => isSaving = false);
        });
      },
      icon:
          isSaving ? const CircularProgressIndicator() : const Icon(Icons.save),
      label: const Text("Save grocery list"),
    );
  }

  Future<int> _callSaveGroceryList() async {
    return _mapFormToGroceryList().store();
  }

  _returnToPreviousPage() => Navigator.pop(context);
}
