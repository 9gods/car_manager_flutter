import 'package:car_manager_flutter/domain/entities/car.dart';

abstract class CarRepository {
  Future<List<Car>> getCars();
  Future<List<Car>> getCarsByBrand(String idStr);
  Future<List<Car>> getCarsByYear(String yearStr);
  Future<Car> getCar(String idStr);
  Future<void> createCar(Car car);
  Future<void> updateCar(Car car);
  Future<void> deleteCar(String idStr);
}
