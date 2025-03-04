import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';

class CustomLogo extends StatelessWidget {
  final bool isHome;
  final String title;

  const CustomLogo({Key? key, required this.isHome, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isHome) {
      return Image.asset('/Logo.png');
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('/LogoNarrow.png'),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.slate300,
              ),
            ),
          ),
        ],
      );
    }
  }
}
