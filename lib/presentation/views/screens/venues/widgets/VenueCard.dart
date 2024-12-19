import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/screens/venues/VenueDetailPage.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/colors.dart';

class VenueCard extends StatelessWidget {
  final Map<String, dynamic> venueData;

  const VenueCard({required this.venueData, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          height: 332,
          width: 358,
          child: Column(
            children: [
              // Image Section
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12), bottom: Radius.circular(12)),
                child: Image.network(
                  venueData['imageUrl'], // Use dynamic data
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Content Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column (Name, Phone, Location)
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            venueData['name'], // Use dynamic data
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Phone
                          Row(
                            children: [
                              const Icon(Icons.phone,
                                  color: AppColors.primary4, size: 18),
                              const SizedBox(width: 8),
                              Text(
                                venueData['phone'], // Use dynamic data
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Location
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: AppColors.primary4, size: 18),
                              const SizedBox(width: 8),
                              Text(
                                venueData['location'], // Use dynamic data
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Right Column (Ratings and Button)
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Ratings
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              venueData['rating']['stars'].toInt(),
                              (index) => const Icon(Icons.star,
                                  color: Colors.orange, size: 14),
                            )..addAll(
                                venueData['rating']['halfStar']
                                    ? [
                                        const Icon(Icons.star_half,
                                            color: Colors.orange, size: 14)
                                      ]
                                    : [],
                              ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${venueData['rating']['reviews']} reviews',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          // View Details Button
                          SizedBox(
                            width: 116,
                            height: 32,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VenueDetailPage(venueData: venueData),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: const Center(
                                // Center the text in the button
                                child: Text(
                                  'View details',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
