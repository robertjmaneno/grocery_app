import 'package:flutter/material.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/buyer/user/componets/profie_pic.dart';
import 'package:grocery_app/screens/buyer/user/componets/profile_menu.dart';
import 'package:provider/provider.dart';

class UserImage extends StatefulWidget {
  const UserImage({Key? key});

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final isDarkMode = themeState.getDarkTheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfilePicture(),
          const SizedBox(height: 20),
          const Text(
            'ROBERT MANENO',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Adding a line between the title and the first profile menu
          Container(
            height: 0.1,
            color: const Color.fromARGB(
                255, 177, 213, 243), // Setting the height of the divider
            child: const Divider(),
          ),

          const SizedBox(height: 12),
          ProfileMenu(
            icon: 'assets/images/edit.svg',
            text: 'Edit your profile',
            press: () {},
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.02), // Adjusting the spacing dynamically
          ProfileMenu(
            icon: 'assets/images/shopping-bag.svg',
            text: 'Orders',
            press: () {},
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.02), // Adjusting the spacing dynamically
          ProfileMenu(
            icon: 'assets/images/heart.svg',
            text: 'Your wishlist',
            press: () {},
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.02), // Adjusting the spacing dynamically
          ProfileMenu(
            icon: 'assets/images/edit.svg',
            text: 'Theme',
            press: () {},
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.02), // Adjusting the spacing dynamically
          ProfileMenu(
            icon: 'assets/images/log-out.svg',
            text: 'Log Out',
            press: () {},
          ),
        ],
      ),
    );
  }
}
