import 'package:car_manager_flutter/domain/entities/car.dart';
import 'package:car_manager_flutter/domain/repositories/car_repository.dart';

class GetCarById {
  final CarRepository repository;
  GetCarById(this.repository);

  Future<Car> call(int id) async {
    try {
      return await repository.getCar(id.toString());
    } catch (e) {
      throw e; // Rethrow the error for further handling
    }
  }
}
