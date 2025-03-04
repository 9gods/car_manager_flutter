import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/bottom_navbar.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/floating_app_bar.dart';

class AboutThisAppPage extends StatelessWidget {
  const AboutThisAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FloatingAppBar(isHome: false, title: '• About this app'),
      bottomNavigationBar: const BottomNavbar(selectedIndex: 3),
      body: const Center(child: Text('About Page')),
    );
  }
}
