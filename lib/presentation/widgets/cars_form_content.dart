import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:garage_manager_flutter/data/repositories/car_repository_impl.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';

class CarsFormContent extends StatefulWidget {
  const CarsFormContent({super.key});

  @override
  CarsFormContentState createState() => CarsFormContentState();
}

class CarsFormContentState extends State<CarsFormContent> {
  final _formKey = GlobalKey<FormState>();

  // Create controllers for each field
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _engineController = TextEditingController();
  final TextEditingController _engineCodeController = TextEditingController();
  final TextEditingController _horsepowerController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _brandController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _engineController.dispose();
    _engineCodeController.dispose();
    _horsepowerController.dispose();
    _priceController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  // Handle form submission
  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      final String brand = _brandController.text;
      final String model = _modelController.text;
      final String engine = _engineController.text;
      final String engineCode = _engineCodeController.text;
      final int year = int.tryParse(_yearController.text) ?? 0;
      final int horsepower = int.tryParse(_horsepowerController.text) ?? 0;
      final int price = int.tryParse(_priceController.text) ?? 0;
      final int weight = int.tryParse(_weightController.text) ?? 0;

      try {
        await CarRepositoryImpl(baseUrl: 'http://localhost:8080').createCar(
          brand,
          model,
          engine,
          engineCode,
          year,
          horsepower,
          price,
          weight,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Car created successfully!')),
        );
      } catch (error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error creating car: $error')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _brandController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Brand is required';
                }
                return null;
              },
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: AppColors.slate800,
                prefixIcon: Icon(
                  LucideIcons.sticker,
                  color: AppColors.slate300,
                ),
                labelText: 'Brand',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColors.slate700, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _modelController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Model is required';
                }
                return null;
              },
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: AppColors.slate800,
                prefixIcon: Icon(LucideIcons.car, color: AppColors.slate300),
                labelText: 'Model',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColors.slate700, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _yearController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Year is required';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: AppColors.slate800,
                prefixIcon: Icon(
                  LucideIcons.calendar,
                  color: AppColors.slate300,
                ),
                labelText: 'Year',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColors.slate700, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _engineController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Engine is required';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      fillColor: AppColors.slate800,
                      prefixIcon: Icon(
                        LucideIcons.calendar,
                        color: AppColors.slate300,
                      ),
                      labelText: 'Engine',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: AppColors.slate700,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _engineCodeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Engine code is required';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      fillColor: AppColors.slate800,
                      prefixIcon: Icon(
                        LucideIcons.calendar,
                        color: AppColors.slate300,
                      ),
                      labelText: 'Engine Code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: AppColors.slate700,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _horsepowerController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Horsepower is required';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: AppColors.slate800,
                prefixIcon: Icon(
                  LucideIcons.calendar,
                  color: AppColors.slate300,
                ),
                labelText: 'Horsepower',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColors.slate700, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Weight is required';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: AppColors.slate800,
                prefixIcon: Icon(
                  LucideIcons.calendar,
                  color: AppColors.slate300,
                ),
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColors.slate700, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Price is required';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: AppColors.slate800,
                prefixIcon: Icon(
                  LucideIcons.calendar,
                  color: AppColors.slate300,
                ),
                labelText: 'Price (BRL)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColors.slate700, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: handleSubmit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
