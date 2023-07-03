import 'package:flutter/material.dart';
import 'package:grocery_app/screens/buyer/widgets/categories_widget.dart';
import 'package:grocery_app/services/utils.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/half-closed-laptop.png',
      'catText': 'Laptops',
    },
    {
      'imgPath': 'assets/images/Watch-PNG-Image.png',
      'catText': 'Watches',
    },
    {
      'imgPath': 'assets/images/lady_shoe.png',
      'catText': 'Shoes',
    },
    {
      'imgPath': 'assets/images/camera.png',
      'catText': 'Cameras',
    },
    {
      'imgPath': 'assets/images/samsung_four.png',
      'catText': 'Phones',
    },
    {
      'imgPath': 'assets/images/toyota_five.png',
      'catText': 'Automobiles',
    },
    {
      'imgPath': 'assets/images/head.png',
      'catText': 'Headphones',
    },
    {
      'imgPath': 'assets/images/makeup.png',
      'catText': 'Cosmetics',
    },
    {
      'imgPath': 'assets/images/ana.png',
      'catText': 'Toys',
    },
    {
      'imgPath': 'assets/images/shirts.png',
      'catText': 'Men Clothing',
    },
  ];

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final utils = Utils(context);
    final bool isDarkTheme = utils.getTheme;
    final Color titleColor = isDarkTheme ? Colors.white : Colors.blue;

    final crossAxisCount = screenWidth > 600 ? 4 : 2;
    const childAspectRatio = 240 / 250;
    const spacing = 10.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyle(
            color: titleColor,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          children: List.generate(widget.catInfo.length, (index) {
            return CategoriesWidget(
              catText: widget.catInfo[index]['catText'],
              imgPath: widget.catInfo[index]['imgPath'],
            );
          }),
        ),
      ),
    );
  }
}
