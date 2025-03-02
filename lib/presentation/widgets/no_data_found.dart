import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/general_card.dart';

class NoDataFound extends StatelessWidget {
  final String description;
  const NoDataFound({required Key? key, required this.description})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.circle_help, size: 20, color: Colors.red.shade400),
            Text(
              description,
              style: TextStyle(
                color: AppColors.slate300,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
