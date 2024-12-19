import 'package:flutter/material.dart';

class GuestCard extends StatelessWidget {
  final String guestName;
  final String gender; // "male" or "female"
  final String letter; // "B" or "G"
  final int wCount, mCount, kCount;

  const GuestCard({
    super.key,
    required this.guestName,
    required this.gender,
    required this.letter,
    required this.wCount,
    required this.mCount,
    required this.kCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to details page
        /* Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(guestName: guestName),
          ),
        );*/
      },
      child: Container(
        width: 304,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 1)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        gender == "male" ? Icons.male : Icons.female,
                        size: 20,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        guestName,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    letter,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Bottom Section with W, M, K values
            Row(
              children: [
                _buildInfoBox(wCount.toString(), "W"),
                _verticalDivider(),
                _buildInfoBox(mCount.toString(), "M"),
                _verticalDivider(),
                _buildInfoBox(kCount.toString(), "K"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.black,
    );
  }
}
