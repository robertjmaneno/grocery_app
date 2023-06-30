import 'package:flutter/material.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final containerWidth = constraints.maxWidth * 0.99;
                final containerHeight = constraints.maxHeight * 0.2;

                return Container(
                  width: containerWidth,
                  height: containerHeight,
                  child: SwitchListTile(
                    title: Text('Theme'),
                    secondary: Icon(
                      themeState.getDarkTheme
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                    ),
                    onChanged: (bool value) {
                      setState(() {
                        themeState.setDarkTheme = value;
                      });
                    },
                    value: themeState.getDarkTheme,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
