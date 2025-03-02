import 'package:car_manager_flutter/domain/entities/car.dart';
import 'package:car_manager_flutter/domain/repositories/car_repository.dart';

class UpdateCar {
  final CarRepository repository;
  UpdateCar(this.repository);

  Future<void> call(Car car) async {
    return await repository.updateCar(car);
  }
}
