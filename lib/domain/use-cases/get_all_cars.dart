import 'package:car_manager_flutter/domain/entities/car.dart';
import 'package:car_manager_flutter/domain/repositories/car_repository.dart';

class GetAllCars {
  final CarRepository repository;
  GetAllCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.getCars();
  }
}
