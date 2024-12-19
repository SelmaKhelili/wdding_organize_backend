import 'package:flutter/material.dart';
import 'ContactInfo.dart';
import 'HeartButton.dart';

class ProfileDetails extends StatelessWidget {
  final String name;
  final String phone;
  final String location;

  const ProfileDetails({
    super.key,
    required this.name,
    required this.phone,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ContactInfo(
                icon: Icons.phone,
                text: phone,
              ),
              const SizedBox(height: 4),
              ContactInfo(
                icon: Icons.location_on,
                text: location,
              ),
              const SizedBox(height: 16),
            ],
          ),
          const Spacer(),
          const HeartButton(), // Interactive heart button
        ],
      ),
    );
  }
}
