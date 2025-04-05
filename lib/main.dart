import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/views/home/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}


/// The MyApp widget is the root of the application.
// ignore: prefer_match_file_name
class MyApp extends StatelessWidget {
/// Creates a new instance of MyApp.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
