import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';
import 'package:garage_manager_flutter/presentation/widgets/home_page_stats.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/bottom_navbar.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/floating_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FloatingAppBar(isHome: true),
      bottomNavigationBar: const BottomNavbar(selectedIndex: 0),
      backgroundColor: AppColors.slate900,
      body: const Column(
        spacing: 16,
        children: [
          SizedBox(height: 8),
          HomePageStats(brandsCreated: '10', carsCreated: '37'),
          Text('//carrousels', style: TextStyle(color: AppColors.slate300)),
        ],
      ),
    );
  }
}
