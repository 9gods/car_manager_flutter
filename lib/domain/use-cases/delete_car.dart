import 'package:car_manager_flutter/domain/repositories/car_repository.dart';

class DeleteCar {
  final CarRepository repository;
  DeleteCar(this.repository);

  Future<void> call(String idStr) async {
    return await repository.deleteCar(idStr);
  }
}
