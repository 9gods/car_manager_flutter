import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/presentation/widgets/cars_form_content.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/bottom_navbar.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/floating_app_bar.dart';

class CarFormPage extends StatelessWidget {
  const CarFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FloatingAppBar(isHome: false, title: '• Create a new car'),
      bottomNavigationBar: const BottomNavbar(selectedIndex: 2),
      backgroundColor: AppColors.slate900,
      body: const CarsFormContent(),
    );
  }
}
