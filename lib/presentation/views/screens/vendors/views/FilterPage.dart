import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/screens/vendors/widgets/ClearApply.dart';
import 'package:zefeffete/presentation/views/screens/vendors/widgets/GenderSelection.dart';
import 'package:zefeffete/presentation/views/screens/vendors/widgets/LocationSelection.dart';
import 'package:zefeffete/presentation/views/screens/vendors/widgets/PriceInputs.dart';
import 'package:zefeffete/presentation/views/screens/vendors/widgets/ReviewRatings.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Filter Options',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                bottom: 60.0), // Reserve space for the fixed button
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                PriceInputs(),
                const SizedBox(height: 20), // Reduced spacing
                GenderSelection(),
                const SizedBox(height: 20), // Reduced spacing
                ReviewRatings(),
                const SizedBox(height: 20), // Reduced spacing
                LocationSelection(),
                const SizedBox(height: 15),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              // Background color for better visibility
              child: ClearApply(),
            ),
          ),
        ],
      ),
    );
  }
}
