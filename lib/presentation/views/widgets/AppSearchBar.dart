import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  final String hintText; // Add hintText parameter

  const AppSearchBar({Key? key, this.hintText = "Search vendors"})
      : super(key: key); // Default value for hintText

  @override
  _AppSearchBarState createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 48,
        width: 358,
        decoration: BoxDecoration(
          color: Color(0xFFF9EDF3), // Light pink background
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(horizontal: 16), // Inner padding
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Color(0xFFD21D70), // Pink icon color
              size: 24,
            ),
            SizedBox(width: 8), // Space between icon and text
            Expanded(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText, // Use the provided hintText
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color:
                        Color.fromARGB(255, 197, 119, 159), // Pink text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
