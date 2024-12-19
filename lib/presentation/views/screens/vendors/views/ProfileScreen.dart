import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../widgets/ProfileImage.dart';
import '../widgets/ProfileDetails.dart';
import '../widgets/LeaveReviewButton.dart';
import '../widgets/ReviewsWidget.dart';
import '../widgets/VendorDetailsMain.dart';

class ProfileScreen extends StatelessWidget {
  final int vendorId;

  const ProfileScreen({required this.vendorId, super.key});

  Future<Map<String, dynamic>> _loadVendorData() async {
    final String jsonString =
        await rootBundle.loadString('assets/photographers.json');
    final List<dynamic> vendors = jsonDecode(jsonString);
    return vendors.firstWhere((vendor) => vendor['id'] == vendorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Profile'),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _loadVendorData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            final rating = data['rating'] ??
                {
                  "averageRating": 0.0,
                  "totalReviews": 0,
                  "starPercentages": [0, 0, 0, 0, 0]
                };

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileImage(imageUrl: data['imageUrl']),
                  const SizedBox(height: 16),
                  ProfileDetails(
                    name: data['name'],
                    phone: data['phone'],
                    location: data['location'],
                  ),
                  const LeaveReviewButton(),
                  ReviewsWidget(
                    averageRating: rating['averageRating'],
                    totalReviews: rating['totalReviews'],
                    starPercentages: List<int>.from(rating['starPercentages']),
                  ),
                  VendorDetailsMain(vendorData: data),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
