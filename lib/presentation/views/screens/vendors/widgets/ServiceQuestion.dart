import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/colors.dart';

/// Service Question Text
class ServiceQuestion extends StatelessWidget {
  const ServiceQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "How was the service?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 20),
        Divider(
          color: Color.fromARGB(255, 196, 192, 192),
          thickness: 1,
          height: 1,
          indent: 40,
          endIndent: 40,
        ),
        SizedBox(height: 20),
        Text(
          "Your overall rating",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primary4,
          ),
        ),
      ],
    );
  }
}
