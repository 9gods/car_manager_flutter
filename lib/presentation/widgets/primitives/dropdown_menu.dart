import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/dropdown_menu_button_item.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.slate800,
          border: Border.all(color: AppColors.slate700),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: double.infinity),
            DropdownMenuButtonItem(
              icon: LucideIcons.info,
              text: 'About this app',
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            DropdownMenuButtonItem(
              icon: LucideIcons.external_link,
              text: 'About Flutter',
              onPressed: () async {
                final url = Uri.parse('https://flutter.dev/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
            DropdownMenuButtonItem(
              icon: LucideIcons.external_link,
              text: 'About Dart',
              onPressed: () async {
                final url = Uri.parse('https://dart.dev/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
