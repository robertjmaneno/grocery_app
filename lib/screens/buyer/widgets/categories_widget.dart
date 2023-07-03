import 'package:flutter/material.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  final String catText;
  final String imgPath;

  const CategoriesWidget(
      {Key? key, required this.catText, required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.blue;

    final TextStyle textStyle = TextStyle(
      color: color,
      fontSize: 10,
    );

    return InkWell(
      onTap: () {
        print('pressed');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.11), width: 1),
        ),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(catText, style: textStyle),
          ],
        ),
      ),
    );
  }
}
