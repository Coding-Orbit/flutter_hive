import 'package:flutter/material.dart';
import 'package:flutter_hive/injector/hive_injector.dart';
import 'package:flutter_hive/screens/home.dart';

Future<void> main() async {
  await HiveInjector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hive Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
