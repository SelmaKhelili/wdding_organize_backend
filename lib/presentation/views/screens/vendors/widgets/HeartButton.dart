import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/colors.dart';

class HeartButton extends StatefulWidget {
  const HeartButton({super.key});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isLiked = false; // Track the state of the button

  void toggleLike() {
    setState(() {
      isLiked = !isLiked; // Toggle the liked state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 35.0),
      child: IconButton(
        onPressed: toggleLike, // Toggle state on press
        icon: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border, // Change icon
          color: AppColors.primary4, // Heart color
          size: 32, // Adjust icon size
        ),
      ),
    );
  }
}
