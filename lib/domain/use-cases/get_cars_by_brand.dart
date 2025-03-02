import 'package:garage_manager_flutter/domain/entities/car.dart';
import 'package:garage_manager_flutter/domain/repositories/car_repository.dart';

class GetCarsByBrand {
  final CarRepository repository;
  GetCarsByBrand(this.repository);

  Future<List<Car>> call(String brand) async {
    try {
      return await repository.getCarsByBrand(brand);
    } catch (e) {
      throw e;
    }
  }
}
