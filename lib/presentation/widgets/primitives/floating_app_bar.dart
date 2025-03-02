import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';

class FloatingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const FloatingAppBar({Key? key, required this.title, this.actions})
    : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 48, 16, 0),
        decoration: BoxDecoration(
          color: AppColors.slate900,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(title, style: const TextStyle(color: AppColors.slate300)),
          actions: actions,
        ),
      ),
    );
  }
}
