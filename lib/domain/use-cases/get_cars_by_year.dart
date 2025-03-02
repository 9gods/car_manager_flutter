import 'package:car_manager_flutter/domain/entities/car.dart';
import 'package:car_manager_flutter/domain/repositories/car_repository.dart';

class GetCarsByYear {
  final CarRepository repository;
  GetCarsByYear(this.repository);

  Future<List<Car>> call(int year) async {
    String yearStr = year.toString();
    try {
      return await repository.getCarsByYear(yearStr);
    } catch (e) {
      throw e;
    }
  }
}
