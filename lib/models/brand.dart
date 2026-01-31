import 'package:bridgeskill_task/models/car.dart';

class Brand {
  final int id;
  final String name;
  final String image;
  final List<Car> cars;

  Brand({
    required this.id,
    required this.name,
    required this.cars,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      name: json['name'],
      image: _mapBrandImage(json['name']),
      cars: (json['cars'] as List)
          .map((carJson) => Car.fromJson(carJson))
          .toList(),
    );
  }
  static String _mapBrandImage(String brandName) {
    switch (brandName.toLowerCase()) {
      case 'toyota':
        return 'assets/images/toyota.png';
      case 'hyundai':
        return 'assets/images/hyundai.png';
      case 'honda':
        return 'assets/images/honda.png';
      default:
        return 'assets/images/default.png';
    }
  }
}
