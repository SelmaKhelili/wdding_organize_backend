import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/colors.dart';

class ReviewRatings extends StatefulWidget {
  const ReviewRatings({super.key});

  @override
  _ReviewRatingsState createState() => _ReviewRatingsState();
}

class _ReviewRatingsState extends State<ReviewRatings> {
  String _selectedRating = '4.5 and above';

  final List<Map<String, String>> _ratings = [
    {'label': '4.5 and above', 'value': '4.5 and above'},
    {'label': '4.0-4.5', 'value': '4.0-4.5'},
    {'label': '3.5-4.0', 'value': '3.5-4.0'},
    {'label': '3.0-3.5', 'value': '3.0-3.5'},
    {'label': '2.5-3.0', 'value': '2.5-3.0'},
    {'label': '2.0-2.5', 'value': '2.0-2.5'},
    {'label': '2.0 and less', 'value': '2.0 and less'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reviews',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        RadioTheme(
          data: RadioThemeData(
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primary4; // Active color
              }
              return AppColors.primary4; // Inactive color
            }),
          ),
          child: Column(
            children: _ratings.map((rating) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: ListTile(
                  dense: true,
                  leading: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  title: Text(
                    rating['label']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: Radio<String>(
                    value: rating['value']!,
                    groupValue: _selectedRating,
                    onChanged: (value) {
                      setState(() {
                        _selectedRating = value!;
                      });
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
