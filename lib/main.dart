import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartcado/libraries/db_handler.dart';
import 'package:smartcado/screens/grocery_list.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  runApp(SmartGroceries());
}

class SmartGroceries extends StatelessWidget {
  SmartGroceries({super.key}) {
    _setupSqliteDatabase();
  }

  _setupSqliteDatabase() {
    WidgetsFlutterBinding.ensureInitialized();
    _setupSqliteForWindowsAndLinux();
    DatabaseHandler().setupDatabase();
  }

  void _setupSqliteForWindowsAndLinux() {
    if (Platform.isWindows || Platform.isLinux) {
      databaseFactory = databaseFactoryFfi;
      sqfliteFfiInit();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mart!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo.shade900),
        useMaterial3: true,
      ),
      home: const GroceryListScreen(),
    );
  }
}
