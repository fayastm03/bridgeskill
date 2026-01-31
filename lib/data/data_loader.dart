import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/brand.dart';

class CarDataLoader {
  static Future<List<Brand>> loadBrands() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/car_data.json',
    );

    final Map<String, dynamic> decodedData = json.decode(jsonString);

    final List brandsJson = decodedData['brands'];

    return brandsJson.map((brandJson) => Brand.fromJson(brandJson)).toList();
  }
}
