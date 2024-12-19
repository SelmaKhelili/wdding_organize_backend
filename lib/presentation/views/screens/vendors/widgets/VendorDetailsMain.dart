import 'package:flutter/material.dart';
import 'PhotosGrid.dart';
import 'PricingPackage.dart';

class VendorDetailsMain extends StatelessWidget {
  final Map<String, dynamic> vendorData;

  const VendorDetailsMain({required this.vendorData, super.key});

  @override
  Widget build(BuildContext context) {
    return VendorDetails(data: vendorData);
  }
}

class VendorDetails extends StatelessWidget {
  final Map<String, dynamic> data;

  const VendorDetails({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About this vendor',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            data['about'],
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Pricing Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...data['pricingDetails'].map<Widget>((package) {
            return PricingPackage(
              title: package['title'],
              price: package['price'],
              details: package['details'],
            );
          }).toList(),
          const SizedBox(height: 10),
          const Text(
            'Additional Costs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            'Travel Fee: ${data['additionalCosts']['travelFee']}\nExtra Staff: ${data['additionalCosts']['extraStaff']}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'Photos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          PhotosGrid(images: List<String>.from(data['photos'])),
        ],
      ),
    );
  }
}
