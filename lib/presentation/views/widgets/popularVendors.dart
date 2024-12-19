import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/homeStyle.dart';
import 'package:zefeffete/presentation/views/screens/vendors/widgets/VendorDetailsMain.dart';
import 'package:zefeffete/presentation/views/screens/vendors/views/ProfileScreen.dart';
import 'package:zefeffete/presentation/views/screens/vendors/views/ProfileScreen.dart';

class PopularVendors extends StatefulWidget {
  const PopularVendors({super.key});

  @override
  State<PopularVendors> createState() => _PopularVendorsState();
}

class _PopularVendorsState extends State<PopularVendors> {
  bool more = false;
  List<Map<String, dynamic>> vendors = [];

  @override
  void initState() {
    super.initState();
    _loadVendors();
  }

  Future<void> _loadVendors() async {
    final String response =
        await rootBundle.loadString('assets/photographers.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      vendors =
          data.map((vendor) => Map<String, dynamic>.from(vendor)).toList();
    });
  }

  final List<Map<String, String>> Vendors = [
    {
      'title': 'Disc jockey Dylia',
      'price': '23000 DA',
      'imagePath': 'assets/images/vendor3.jpg',
      'location': 'Algiers',
      'rating': '4.5',
      'path': 'dummypath'
    },
    {
      'title': 'Wedding photographer Maissa',
      'price': '20000 DA',
      'imagePath': 'assets/images/vendor2.jpg',
      'location': 'Algiers',
      'rating': '4.7',
      'path': 'dummypath'
    },
    {
      'title': 'Traiteur Aissa',
      'price': '33000 DA',
      'imagePath': 'assets/images/vendor1.jpg',
      'location': 'Algiers',
      'rating': '4.6',
      'path': 'dummypath'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular vendors',
              style: bestVendor,
            ),
            const SizedBox(height: 16),
            Column(children: [
              _vendorCard('Disc jockey Dylia', '23000 DA',
                  'assets/images/vendor1.jpg', 'Algiers', 4.5, 'dummypath'),
              _vendorCard('Wedding photographer Maissa', '20000 DA',
                  'assets/images/vendor2.jpg', 'Algiers', 4.8, 'dummypath'),
              _vendorCard('Traiteur Aissa', '30000 DA',
                  'assets/images/vendor3.jpg', 'Algiers', 4.6, 'dummypath'),
              _vendorCard('Traiteur Aissa', '30000 DA',
                  'assets/images/vendor1.jpg', 'Algiers', 4.5, 'dummypath'),
            ]),
            Visibility(
                visible: more,
                child: Column(
                  children: [
                    for (int i = 0; i < Vendors.length; i++)
                      _vendorCard(
                        Vendors[i]['title']!,
                        Vendors[i]['price']!,
                        Vendors[i]['imagePath']!,
                        Vendors[i]['location']!,
                        double.parse(Vendors[i]['rating']!),
                        Vendors[i]['path']!,
                      ),
                  ],
                )),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  more = !more;
                });
              },
              child: Center(
                  child:
                      Text((!more) ? "See more" : 'See less', style: seeMore)),
            )
          ],
        ));
  }

  Widget _vendorCard(String name, String price, String imagePath,
      String location, double rating, String path) {
    return GestureDetector(
      onTap: () {
        final vendor = vendors[0];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(
              vendorId: vendor["id"],
            ),
          ),
        );
      },
      child: Card(
        elevation: 0,
        color: const Color.fromARGB(0, 246, 246, 246),
        margin: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 30,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: GoogleFonts.raleway()),
              const SizedBox(height: 2),
              Text(
                price,
                style: GoogleFonts.raleway(
                  color: const Color.fromARGB(255, 247, 117, 156),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              const Icon(Icons.location_on, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(location, style: const TextStyle(color: Colors.grey)),
              const SizedBox(width: 12),
              const Icon(Icons.star, size: 14, color: Colors.orange),
              const SizedBox(width: 4),
              Text(
                rating.toStringAsFixed(1),
                style: GoogleFonts.raleway(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
