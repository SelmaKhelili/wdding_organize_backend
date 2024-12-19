import 'package:flutter/material.dart';

class ReviewsWidget extends StatelessWidget {
  final double averageRating;
  final int totalReviews;
  final List<int>
      starPercentages; // 5 to 1 star percentages, e.g., [74, 15, 3, 3, 5]

  const ReviewsWidget({
    super.key,
    required this.averageRating,
    required this.totalReviews,
    required this.starPercentages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          // Left Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                averageRating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index <
                            averageRating
                                .toInt() // Only integer part determines filled stars
                        ? Icons.star
                        : Icons.star_border,
                    color: const Color.fromRGBO(242, 120, 13, 1),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$totalReviews reviews',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          // Right Section
          Expanded(
            child: Column(
              children: List.generate(5, (index) {
                int star = 5 - index; // To show from 5 stars to 1 star
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Text(
                        star.toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          child: LinearProgressIndicator(
                            value: starPercentages[index] / 100,
                            backgroundColor:
                                const Color.fromRGBO(232, 217, 207, 1),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(242, 120, 13, 1)),
                            minHeight: 10, // Thickness of the progress bar
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${starPercentages[index]}%',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
