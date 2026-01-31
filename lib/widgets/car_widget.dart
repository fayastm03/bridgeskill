import 'package:bridgeskill_task/models/car.dart';
import 'package:flutter/material.dart';

class CarWidget extends StatelessWidget {
  final Car car;
  const CarWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
      child: Card(
        key: ValueKey(car.id),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                car.model,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 1),
                      Text('Year:${car.year}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee),
                      Text('${car.price}'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
