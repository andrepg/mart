import 'package:flutter/material.dart';

class ModalGroceryListCreate extends StatefulWidget {
  const ModalGroceryListCreate({super.key});

  @override
  State<ModalGroceryListCreate> createState() => _ModalGroceryListCreateState();
}

class _ModalGroceryListCreateState extends State<ModalGroceryListCreate> {
  bool _isLoading = false;
  bool _allowSaving = false;

  final _globalFormKey = GlobalKey<FormState>();
  final TextEditingController _groceryNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _groceryNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Give a name to your grocery list",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextFormField(
            key: _globalFormKey,
            maxLength: 30,
            autofocus: true,
            onChanged: _toggleSaveButtonState,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => (value == null || value.isEmpty)
                ? "Please provide a grocery list name"
                : null,
            controller: _groceryNameController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildDiscardButton(),
                _buildSaveButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSaveButtonState(value) =>
      setState(() => _allowSaving = value.toString().isNotEmpty);

  Widget _buildDiscardButton() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: _popModalFromRoute,
          child: const Text("Discard"),
        ),
      );

  void _popModalFromRoute() => Navigator.of(context).pop();

  Widget _buildSaveButton() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(
          onPressed: _allowSaving ? _saveGroceryList : null,
          child: const Text("Save"),
        ),
      );

  void _saveGroceryList() {
    setState(() => _isLoading = true);
  }
}
