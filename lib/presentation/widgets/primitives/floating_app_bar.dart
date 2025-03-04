import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/custom_logo.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/dropdown_menu.dart';

class FloatingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final String title;

  const FloatingAppBar({Key? key, required this.isHome, this.title = ''})
    : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  void _showDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const CustomDropdownMenu(),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: AppColors.slate900,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: CustomLogo(isHome: isHome, title: title),
            actions: [
              IconButton(
                icon: const Icon(
                  LucideIcons.sandwich,
                  color: AppColors.slate300,
                ),
                onPressed: () => _showDropdown(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
