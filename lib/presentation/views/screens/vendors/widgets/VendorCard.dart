import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/colors.dart';

class VendorCard extends StatefulWidget {
  final String name;
  final String phone;
  final String location;
  final String imageUrl;
  final VoidCallback onTap;
  final bool isLiked;
  final VoidCallback onLike;
  final VoidCallback onUnlike;

  const VendorCard({
    required this.name,
    required this.phone,
    required this.location,
    required this.imageUrl,
    required this.onTap,
    required this.isLiked,
    required this.onLike,
    required this.onUnlike,
    super.key,
  });

  @override
  _VendorCardState createState() => _VendorCardState();
}

class _VendorCardState extends State<VendorCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Vendor image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.imageUrl,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Vendor details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.phone,
                            color: AppColors.primary4, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          widget.phone,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: AppColors.primary4, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          widget.location,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Heart icon
              IconButton(
                iconSize: 26,
                icon: Icon(
                  widget.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primary4,
                ),
                onPressed: () {
                  if (widget.isLiked) {
                    widget.onUnlike(); // Call onUnlike if already liked
                  } else {
                    widget.onLike(); // Call onLike if not liked
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
