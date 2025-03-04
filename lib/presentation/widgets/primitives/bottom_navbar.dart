import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/bottom_navbar_item.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  const BottomNavbar({Key? key, required this.selectedIndex}) : super(key: key);

  static const List<BottomNavbarItem> items = [
    BottomNavbarItem(icon: LucideIcons.house, route: '/'),
    BottomNavbarItem(icon: LucideIcons.captions, route: '/cars-display'),
    BottomNavbarItem(icon: LucideIcons.plus, route: '/car-form'),
    BottomNavbarItem(icon: LucideIcons.info, route: '/about'),
    BottomNavbarItem(icon: LucideIcons.github),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      // padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.slate800,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.slate700,
          width: 1,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              items.asMap().entries.map((e) {
                final index = e.key;
                final item = e.value;
                final isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap:
                      item.icon == LucideIcons.github
                          ? () async {
                            final url = Uri.parse('https://github.com/9gods');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          }
                          : () {
                            Navigator.pushNamed(context, item.route!);
                          },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.all(8),
                    decoration:
                        isSelected
                            ? BoxDecoration(
                              color: AppColors.slate700,
                              borderRadius: BorderRadius.circular(8),
                            )
                            : item.icon == LucideIcons.plus
                            ? BoxDecoration(
                              color: AppColors.slate300,
                              borderRadius: BorderRadius.circular(8),
                            )
                            : null,
                    child:
                        item.icon != LucideIcons.plus
                            ? Icon(item.icon, color: AppColors.slate300)
                            : Icon(item.icon, color: AppColors.slate800),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
