import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onChanged,
      this.child})
      : super(key: key);

  final String text, icon;
  final ValueChanged<bool>? onChanged;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width *
            0.05, // Adjust the horizontal padding dynamically
        vertical: MediaQuery.of(context).size.height *
            0.01, // Adjust the vertical padding dynamically
      ),
      child: TextButton(
        onPressed: () {
          if (onChanged != null) {
            // Pass the desired parameter value to the onChanged callback
            onChanged!(true); // example parameter value
          }
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height *
                  0.02, // Adjust the padding dynamically
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFF5F6F9)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 25,
                color: Colors.blue,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
