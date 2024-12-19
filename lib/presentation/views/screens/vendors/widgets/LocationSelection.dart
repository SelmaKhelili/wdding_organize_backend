import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocationSelection extends StatefulWidget {
  const LocationSelection({super.key});

  @override
  _LocationSelectionState createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  Map<String, List<String>> wilayas = {};
  String? selectedWilaya;
  final Map<String, List<String>> selectedCommunes = {};

  @override
  void initState() {
    super.initState();
    _loadWilayaData();
  }

  Future<void> _loadWilayaData() async {
    // Load the JSON file from assets
    final String jsonString =
        await rootBundle.loadString('assets/wilayas.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    // Convert to Map<String, List<String>>
    setState(() {
      wilayas = jsonData.map((key, value) {
        return MapEntry(key, List<String>.from(value));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: wilayas.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator(), // Show loader until data is loaded
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButton<String>(
                  isExpanded: true,
                  value: null, // Ensure placeholder is always shown
                  hint: const Text('Add Wilaya'),
                  items: wilayas.keys.map((String wilaya) {
                    return DropdownMenuItem<String>(
                      value: wilaya,
                      child: Text(wilaya),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedWilaya = value;
                      // Add selected Wilaya to the selectedCommunes map if not already present
                      if (!selectedCommunes.containsKey(value)) {
                        selectedCommunes[value!] = [];
                      }
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Select Communes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200, // Set a fixed height for the ListView
                  child: ListView(
                    children: selectedCommunes.entries.map((entry) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(entry.key),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedCommunes.remove(entry.key);
                                  });
                                },
                              ),
                            ],
                          ),
                          children: wilayas[entry.key]!.map((commune) {
                            return CheckboxListTile(
                              title: Text(commune),
                              value: entry.value.contains(commune),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    entry.value.add(commune);
                                  } else {
                                    entry.value.remove(commune);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
