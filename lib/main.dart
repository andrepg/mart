import 'package:flutter/material.dart';
import 'package:smartcado/database/sqlite_init.dart';
import 'package:smartcado/screens/grocery_list_screen.dart';

void main() {
  runApp(SmartGroceries());
}

class SmartGroceries extends StatelessWidget {
  SmartGroceries({super.key}) {
    SqliteInitialization.initializeSqliteDatabase();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mart!',
      home: GroceryListScreen(),
    );
  }
}
