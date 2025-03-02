import 'package:car_manager_flutter/domain/entities/car.dart';
import 'package:car_manager_flutter/domain/repositories/car_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarRepositoryImpl implements CarRepository {
  final String baseUrl;

  CarRepositoryImpl({required this.baseUrl});

  @override
  Future<List<Car>> getCars() async {
    final response = await http.get(Uri.parse('$baseUrl/cars'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data
          .map(
            (json) => Car(
              id: json['id'],
              model: json['model'],
              brand: json['brand'],
              year: json['year'],
              engine: json['engine'],
              engineCode: json['engineCode'],
              horsepower: json['horsepower'],
              price: json['price'],
              weight: json['weight'],
            ),
          )
          .toList();
    } else if (response.body == 'NO_CARS_AVAILABLE') {
      return [];
    } else {
      throw Exception(
        'Failed to fetch cars: ${response.statusCode} - ${response.body}',
      );
    }
  }

  @override
  Future<Car> getCar(String idStr) async {
    final response = await http.get(Uri.parse('$baseUrl/cars/$idStr'));
    if (response.statusCode == 200) {
      final Car data = json.decode(response.body);
      return data;
    } else if (response.body == 'INVALID_ID') {
      return [] as Car;
    } else if (response.body == 'CAR_NOT_FOUND') {
      return [response.body] as Car;
    } else {
      throw Exception(
        'Failed to fetch car: ${response.statusCode} - ${response.body}',
      );
    }
  }

  @override
  Future<List<Car>> getCarsByBrand(String brand) async {
    final response = await http.get(Uri.parse('$baseUrl/cars/$brand'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data
          .map(
            (json) => Car(
              id: json['id'],
              model: json['model'],
              brand: json['brand'],
              year: json['year'],
              engine: json['engine'],
              engineCode: json['engineCode'],
              horsepower: json['horsepower'],
              price: json['price'],
              weight: json['weight'],
            ),
          )
          .toList();
    } else if (response.body == 'INVALID_BRAND') {
      return [];
    } else if (response.body == 'CAR_NOT_FOUND') {
      return [];
    } else {
      throw Exception(
        'Failed to fetch cars by brand: ${response.statusCode} - ${response.body}',
      );
    }
  }

  @override
  Future<List<Car>> getCarsByYear(String yearStr) async {}

  @override
  Future<void> createCar(
    String brand,
    String model,
    String engine,
    String engineCode,
    int year,
    int horsepower,
    int price,
    int weight,
  ) async {
    final response = await http.post(Uri.parse('$baseUrl/cars'));
  }

  @override
  Future<void> deleteCar(String idStr) async {
    // TODO: implement deleteCar
  }

  @override
  Future<void> updateCar(Car car) async {
    // TODO: implement updateCar
  }
}
