import 'package:garage_manager_flutter/domain/entities/car.dart';
import 'package:garage_manager_flutter/domain/repositories/car_repository.dart';
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
    } else if (response.body == 'CARS_NOT_FOUND') {
      return [];
    } else {
      throw Exception(
        'Failed to fetch cars by brand: ${response.statusCode} - ${response.body}',
      );
    }
  }

  @override
  Future<List<Car>> getCarsByYear(String yearStr) async {
    final response = await http.get(Uri.parse('$baseUrl/cars/$yearStr'));
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
    } else if (response.body == 'INVALID_YEAR') {
      return [];
    } else if (response.body == 'CARS_NOT_FOUND') {
      return [];
    } else {
      throw Exception(
        'Failed to fetch cars by year: ${response.statusCode} - ${response.body}',
      );
    }
  }

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
    final url = Uri.parse('$baseUrl/cars');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'brand': brand,
        'model': model,
        'engine': engine,
        'engineCode': engineCode,
        'year': year,
        'horsepower': horsepower,
        'price': price,
        'weight': weight,
      }),
    );
    if (response.statusCode == 201) {
      final result = json.decode(response.body);
      return result;
    } else {
      throw Exception(
        'Failed to create car: ${response.statusCode} - ${response.body}',
      );
    }
  }

  @override
  Future<void> updateCar(Car car) async {
    final url = Uri.parse('$baseUrl/cars/${car.id}');
    final response = await http.put(
      url,
      body: json.encode({
        'brand': car.brand,
        'model': car.model,
        'engine': car.engine,
        'engineCode': car.engineCode,
        'year': car.year,
        'horsepower': car.horsepower,
        'price': car.price,
        'weight': car.weight,
      }),
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return result;
    } else if (response.body == 'INVALID_ID') {
      final result = json.decode(response.body);
      return result;
    } else if (response.body == 'CAR_NOT_FOUND') {
      final result = json.decode(response.body);
      return result;
    } else {
      throw Exception(
        'Failed to update car: ${response.statusCode} - ${response.body}',
      );
    }
  }

  @override
  Future<void> deleteCar(String idStr) async {
    final response = await http.delete(Uri.parse('$baseUrl/cars/$idStr'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return result;
    } else if (response.body == 'INVALID_ID') {
      final result = json.decode(response.body);
      return result;
    } else if (response.body == 'CAR_NOT_FOUND') {
      final result = json.decode(response.body);
      return result;
    } else {
      throw Exception(
        'Failed to delete car: ${response.statusCode} - ${response.body}',
      );
    }
  }
}
