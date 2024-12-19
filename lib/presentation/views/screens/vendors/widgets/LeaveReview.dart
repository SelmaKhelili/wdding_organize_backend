import 'package:flutter/material.dart';
import 'HeaderSection.dart';
import 'ServiceQuestion.dart';
import 'RatingStars.dart';
import 'ButtonSection.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/colors.dart';

class LeaveReview extends StatefulWidget {
  const LeaveReview({super.key});

  @override
  _LeaveReviewModalState createState() => _LeaveReviewModalState();
}

class _LeaveReviewModalState extends State<LeaveReview> {
  int _selectedRating = 0; // Stores the selected rating (1 to 5)

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: const BoxDecoration(
            color: AppColors.secondary2,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Title and Close Icon
              const HeaderSection(),

              const SizedBox(height: 20),

              // Divider above "Your overall rating"

              const SizedBox(height: 10),

              // Service Question
              const ServiceQuestion(),

              const SizedBox(height: 10),

              // Divider below "Your overall rating"

              const SizedBox(height: 10),

              // Rating Stars
              RatingStars(
                selectedRating: _selectedRating,
                onRatingSelected: (rating) {
                  setState(() {
                    _selectedRating = rating;
                  });
                },
              ),

              // Divider after stars
              const Divider(
                color: Color.fromARGB(255, 198, 197, 197),
                thickness: 1,
                height: 1,
                indent: 40, // Adds space before the divider (on the left side)
                endIndent:
                    40, // Adds space after the divider (on the right side)
              ),

              const SizedBox(height: 20),

              const Spacer(), // Push buttons to the bottom

              // Cancel and Submit Buttons
              ButtonSection(
                onSubmit: () {
                  if (_selectedRating == 0) {
                    // Show error dialog for 0 rating
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Invalid Rating"),
                        content: const Text("Please select at least 1 star."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Close modal and show rating confirmation
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Review Submitted"),
                          content: Text(
                              "You rated the service $_selectedRating stars."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
