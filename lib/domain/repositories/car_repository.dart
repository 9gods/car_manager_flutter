import 'package:car_manager_flutter/domain/entities/car.dart';

abstract class CarRepository {
  Future<List<Car>> getCars();
  Future<List<Car>> getCarsByBrand(String idStr);
  Future<List<Car>> getCarsByYear(String yearStr);
  Future<Car> getCar(String idStr);
  Future<void> createCar(
    String brand,
    String model,
    String engine,
    String engineCode,
    int year,
    int horsepower,
    int price,
    int weight,
  );
  Future<void> updateCar(Car car);
  Future<void> deleteCar(String idStr);
}
