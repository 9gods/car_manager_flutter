import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/presentation/pages/about_this_app_page.dart';
import 'package:garage_manager_flutter/presentation/pages/car_detail_page.dart';
import 'package:garage_manager_flutter/presentation/pages/car_form_page.dart';
import 'package:garage_manager_flutter/presentation/pages/cars_display_page.dart';
import 'package:garage_manager_flutter/presentation/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garage Manager',
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutThisAppPage(),
        '/car-detail': (context) => const CarDetailPage(),
        '/car-form': (context) => const CarFormPage(),
        '/cars-display': (context) => const CarsDisplayPage(),
      },
    );
  }
}
