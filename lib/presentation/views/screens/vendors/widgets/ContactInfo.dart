import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/colors.dart';

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfo({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        width: 238,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: AppColors.primary4,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.primary4,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
