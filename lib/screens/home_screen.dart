import 'package:bridgeskill_task/data/data_loader.dart';
import 'package:bridgeskill_task/models/brand.dart';
import 'package:bridgeskill_task/widgets/brand_widget.dart';
import 'package:bridgeskill_task/widgets/car_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Brand> brands = [];
  Brand? selectedBrand;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBrands();
  }

  Future<void> loadBrands() async {
    final data = await CarDataLoader.loadBrands();
    setState(() {
      brands = data;
      isLoading = false;
    });
  }

  void selectBrand(Brand brand) {
    setState(() {
      selectedBrand = brand;
    });
  }

  void goBack() {
    setState(() {
      selectedBrand = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Brands'),
        leading: selectedBrand != null
            ? IconButton(icon: const Icon(Icons.arrow_back), onPressed: goBack)
            : null,
      ),
      body: selectedBrand == null ? buildBrandList() : buildCarList(),
    );
  }

  Widget buildBrandList() {
    return ListView.builder(
      itemCount: brands.length,
      itemBuilder: (context, index) {
        return BrandWidget(
          key: ValueKey(brands[index].id),
          brand: brands[index],
          onTap: () => selectBrand(brands[index]),
        );
      },
    );
  }

  Widget buildCarList() {
    return ListView.builder(
      itemCount: selectedBrand!.cars.length,
      itemBuilder: (context, index) {
        return CarWidget(
          key: ValueKey(selectedBrand!.cars[index].id),
          car: selectedBrand!.cars[index],
        );
      },
    );
  }
}
