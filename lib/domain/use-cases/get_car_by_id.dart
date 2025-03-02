import 'package:garage_manager_flutter/domain/entities/car.dart';
import 'package:garage_manager_flutter/domain/repositories/car_repository.dart';

class GetCarById {
  final CarRepository repository;
  GetCarById(this.repository);

  Future<Car> call(String idStr) async {
    try {
      return await repository.getCar(idStr);
    } catch (e) {
      throw e; // Rethrow the error for further handling
    }
  }
}
