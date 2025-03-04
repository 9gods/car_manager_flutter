import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/bottom_navbar.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/floating_app_bar.dart';

class CarsDisplayPage extends StatelessWidget {
  const CarsDisplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FloatingAppBar(isHome: false, title: '• Cars display'),
      bottomNavigationBar: const BottomNavbar(selectedIndex: 1),
      body: const Center(child: Text('Cars cards')),
    );
  }
}
