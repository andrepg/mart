import 'package:flutter/material.dart';
import 'package:smartcado/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smartcado',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 33, 125, 36)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

