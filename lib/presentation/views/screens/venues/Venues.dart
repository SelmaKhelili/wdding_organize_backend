import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'widgets/VenueCard.dart';
import 'package:zefeffete/presentation/views/widgets/AppSearchBar.dart';
import 'package:zefeffete/presentation/views/widgets/bottomNavigationBar.dart';

class Venues extends StatelessWidget {
  const Venues({super.key});

  // Function to load data from JSON file
  Future<List<Map<String, dynamic>>> _loadVenueData() async {
    final String jsonString = await rootBundle.loadString('assets/venues.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((item) => item as Map<String, dynamic>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "Venues",
              style: TextStyle(
                fontSize: 25,
              ), // Optional styling
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar at the top (placeholder for your custom search bar widget)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: AppSearchBar(hintText: "Search for venues"),
          ),
          // Load and display venue data
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _loadVenueData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No venues found.'));
                } else {
                  final venues = snapshot.data!;
                  return ListView.builder(
                    itemCount: venues.length,
                    itemBuilder: (context, index) {
                      final venue = venues[index];
                      return VenueCard(venueData: venue); // Pass venue data
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentRoute: '/venues'),
    );
  }
}
