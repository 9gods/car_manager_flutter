import 'package:car_manager_flutter/domain/entities/car.dart';

abstract class CarRepository {
  Future<List<Car>> getCars();
  Future<Car> getCar(String id);
  Future<void> addCar(Car car);
  Future<void> updateCar(Car car);
  Future<void> deleteCar(String id);
}
