import 'package:flutter/material.dart';

/// Rating Stars Section
class RatingStars extends StatelessWidget {
  final int selectedRating;
  final ValueChanged<int> onRatingSelected;

  const RatingStars({
    super.key,
    required this.selectedRating,
    required this.onRatingSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => IconButton(
          onPressed: () => onRatingSelected(index + 1),
          icon: Icon(
            index < selectedRating ? Icons.star : Icons.star_border,
            color: Colors.orange,
            size: 32,
          ),
        ),
      ),
    );
  }
}
