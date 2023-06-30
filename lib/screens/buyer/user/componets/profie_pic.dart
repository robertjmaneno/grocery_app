import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(fit: StackFit.expand, children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/robert.jpg'),
        ),
        Positioned(
          right: -9,
          bottom: 1,
          child: SizedBox(
            width: 45,
            height: 45,
            child: TextButton(
              onPressed: () {},
              child: Container(
                width: 300,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/images/camera.svg',
                  //color: isDarkMode ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
