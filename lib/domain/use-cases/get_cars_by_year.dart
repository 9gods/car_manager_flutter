import 'package:garage_manager_flutter/domain/entities/car.dart';
import 'package:garage_manager_flutter/domain/repositories/car_repository.dart';

class GetCarsByYear {
  final CarRepository repository;
  GetCarsByYear(this.repository);

  Future<List<Car>> call(String yearStr) async {
    try {
      return await repository.getCarsByYear(yearStr);
    } catch (e) {
      throw e;
    }
  }
}
