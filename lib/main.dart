import 'package:flutter/material.dart';
import 'package:smartcado/libraries/sqlite_init.dart';
import 'package:smartcado/screens/login.dart';

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
      home: LoginScreen(),
    );
  }
}
