import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/floating_app_bar.dart';

class CarFormPage extends StatelessWidget {
  const CarFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FloatingAppBar(isHome: false, title: '• Create a new car'),
      body: const Center(child: Text('Create car form')),
    );
  }
}
