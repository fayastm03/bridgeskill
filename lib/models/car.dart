class Car {
  final int id;
  final String model;
  final int year;
  final int price;

  Car({
    required this.id,
    required this.model,
    required this.year,
    required this.price,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      model: json['model'],
      year: json['year'],
      price: json['price'],
    );
  }
}
