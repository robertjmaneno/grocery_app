import 'package:flutter/material.dart';
import 'package:grocery_app/buyer/screens/homescreen.dart';
import 'package:grocery_app/consts/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isDark = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      theme: Styles.themeData(true, context),
      home: const HomeScreen(),
    );
  }
}
