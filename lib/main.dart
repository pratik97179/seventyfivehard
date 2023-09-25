import 'package:flutter/material.dart';
import 'package:seventyfivehard/ui/authentication/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '75 Hard',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Authentication(),
    );
  }
}
