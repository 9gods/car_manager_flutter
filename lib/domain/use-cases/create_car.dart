import 'package:garage_manager_flutter/domain/repositories/car_repository.dart';

class CreateCar {
  final CarRepository repository;
  CreateCar(this.repository);

  Future<void> call(
    String brand,
    String model,
    String engine,
    String engineCode,
    int year,
    int horsepower,
    int price,
    int weight,
  ) async {
    return await repository.createCar(
      brand,
      model,
      engine,
      engineCode,
      year,
      horsepower,
      price,
      weight,
    );
  }
}
