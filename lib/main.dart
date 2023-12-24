import 'package:flutter/material.dart';
import 'package:smartcado/screens/grocery_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smartcado/firebase_options.dart';


void main() async {
  runApp(const SmartGroceries());
}

class SmartGroceries extends StatelessWidget {
  const SmartGroceries({super.key});

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

