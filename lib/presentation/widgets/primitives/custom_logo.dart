import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final bool isHome;
  final String title;

  const CustomLogo({Key? key, required this.isHome, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isHome) {
      return Image.asset('assets/logo_normal.png', height: 40);
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/logo_narrow.png', height: 40),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      );
    }
  }
}
