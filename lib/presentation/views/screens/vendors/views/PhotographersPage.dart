import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../../widgets/AppSearchBar.dart';
import '../widgets/VendorCard.dart';
import 'ProfileScreen.dart';
import 'package:zefeffete/presentation/views/screens/liked_vendors/globals.dart';
import 'FilterPage.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/colors.dart';

class PhotographersPage extends StatefulWidget {
  const PhotographersPage({super.key});

  @override
  _PhotographersPageState createState() => _PhotographersPageState();
}

class _PhotographersPageState extends State<PhotographersPage> {
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

  void _likeVendor(Map<String, dynamic> vendor) {
    likedVendors.value = [...likedVendors.value, vendor];
  }

  void _unlikeVendor(Map<String, dynamic> vendor) {
    likedVendors.value =
        likedVendors.value.where((v) => v['id'] != vendor['id']).toList();
  }

  bool _isVendorLiked(Map<String, dynamic> vendor) {
    return likedVendors.value.any((v) => v['id'] == vendor['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: likedVendors,
        builder: (context, likedVendorsList, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 20),
                child: Center(
                    child: Stack(
                  children: [
                    const AppSearchBar(),
                    Positioned(
                      right: 28.0,
                      top: 0.0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.filter_list,
                          color: AppColors.primary4,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FilterPage()),
                          );
                        },
                      ),
                    ),
                  ],
                )),
              ),
              Expanded(
                child: vendors.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: vendors.length,
                        itemBuilder: (context, index) {
                          final vendor = vendors[index];
                          return VendorCard(
                            name: vendor['name'],
                            phone: '${vendor['phone']}',
                            location: '${vendor['location']}',
                            imageUrl: vendor['imageUrl'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileScreen(
                                    vendorId: vendor["id"],
                                  ),
                                ),
                              );
                            },
                            isLiked: _isVendorLiked(vendor),
                            onLike: () => _likeVendor(vendor),
                            onUnlike: () => _unlikeVendor(vendor),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
