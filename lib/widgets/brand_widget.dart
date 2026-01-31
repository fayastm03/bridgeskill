import 'package:bridgeskill_task/models/brand.dart';
import 'package:flutter/material.dart';

class BrandWidget extends StatelessWidget {
  final Brand brand;
  final VoidCallback onTap;
  const BrandWidget({super.key, required this.brand, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          key: ValueKey(brand.id),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  brand.image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 8.0),
                Text(
                  brand.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
