import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/floating_app_bar.dart';

class CarDetailPage extends StatelessWidget {
  const CarDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FloatingAppBar(isHome: false, title: '• Car details'),
      body: const Center(child: Text('Car Details Page')),
    );
  }
}
