import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/buyer/cart_screen.dart';
import 'package:grocery_app/screens/buyer/categories.dart';
import 'package:grocery_app/screens/buyer/home_screen.dart';
import 'package:grocery_app/screens/buyer/user.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _pagesIndex = 1;

  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Home Screen'},
    {
      'page': CategoryScreen(),
      'title': 'Category Screen'
    }, // Added CategoryScreen here
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'User Screen'},
  ];

  void _pagesUpdate(int newPage) {
    setState(() {
      _pagesIndex = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: _pages[_pagesIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeState.getDarkTheme
            ? Theme.of(context).cardColor
            : Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _pagesIndex,
        onTap: _pagesUpdate,
        items: const [
          BottomNavigationBarItem(icon: Icon(EvaIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Ionicons.cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(LineIcons.user), label: 'Profile'),
        ],
      ),
    );
  }
}
