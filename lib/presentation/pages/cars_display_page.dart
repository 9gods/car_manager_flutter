import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/data/repositories/car_repository_impl.dart';
import 'package:garage_manager_flutter/domain/entities/car.dart';
import 'package:garage_manager_flutter/presentation/widgets/cars_display_content.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';
import 'package:garage_manager_flutter/presentation/widgets/no_data_found.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/bottom_navbar.dart';
import 'package:garage_manager_flutter/presentation/widgets/primitives/floating_app_bar.dart';

class CarsDisplayPage extends StatelessWidget {
  Future<List<Car>> getCars() async {
    // Ensure your baseUrl is properly formatted (e.g., 'http://localhost:8080')
    return await CarRepositoryImpl(baseUrl: 'http://localhost:8080').getCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FloatingAppBar(isHome: false, title: '• Cars display'),
      bottomNavigationBar: const BottomNavbar(selectedIndex: 1),
      backgroundColor: AppColors.slate900,
      body: FutureBuilder<List<Car>>(
        future: getCars(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final cars = snapshot.data!;
            if (cars.isEmpty) {
              return const Center(
                child: NoDataFound(description: 'No cars available'),
              );
            } else {
              return CarsDisplayContent(cars: cars);
            }
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
