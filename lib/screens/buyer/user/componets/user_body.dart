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
            onChanged: (Null) {},
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.02), // Adjusting the spacing dynamically
          ProfileMenu(
            icon: 'assets/images/shopping-bag.svg',
            text: 'Orders',
            onChanged: (Null) {},
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.02), // Adjusting the spacing dynamically
          ProfileMenu(
            icon: 'assets/images/heart.svg',
            text: 'Your wishlist',
            onChanged: (Null) {},
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.02), // Adjusting the spacing dynamically

          //the start of the theme
          SizedBox(
            width: MediaQuery.of(context).size.width *
                0.9, // Adjust the width as needed
            height: 55, // Adjust the height as needed
            child: TextButton(
              onPressed: () {
                setState(() {
                  themeState.setDarkTheme = !themeState.getDarkTheme;
                });
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(0),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFF5F6F9)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 11), // Adjust the right padding as needed
                    child: Icon(
                      themeState.getDarkTheme
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      size: 25,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Theme',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    onChanged: (bool value) {
                      setState(() {
                        themeState.setDarkTheme = value;
                      });
                    },
                    value: themeState.getDarkTheme,
                  ),
                ],
              ),
            ),
          )

          //the end of the theme
          ,
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.02), // Adjusting the spacing dynamically
          ProfileMenu(
            icon: 'assets/images/log-out.svg',
            text: 'Log Out',
            onChanged: (Null) {
              _showLogOutDialogue();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showLogOutDialogue() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.1),
          ),
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
