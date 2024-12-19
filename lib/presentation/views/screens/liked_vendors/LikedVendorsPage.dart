import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/screens/vendors/widgets/VendorCard.dart';
import 'package:zefeffete/presentation/views/screens/liked_vendors/globals.dart';
import 'package:zefeffete/presentation/views/screens/vendors/views/ProfileScreen.dart';

class LikedVendorsPage extends StatelessWidget {
  const LikedVendorsPage({super.key});

  void _unlikeVendor(Map<String, dynamic> vendor) {
    likedVendors.value =
        likedVendors.value.where((v) => v['id'] != vendor['id']).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Liked Vendors')),
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: likedVendors,
        builder: (context, likedVendorsList, child) {
          return likedVendorsList.isEmpty
              ? const Center(child: Text('No liked vendors yet.'))
              : ListView.builder(
                  itemCount: likedVendorsList.length,
                  itemBuilder: (context, index) {
                    final vendor = likedVendorsList[index];
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
                      isLiked: true,
                      onLike: () {},
                      onUnlike: () => _unlikeVendor(vendor),
                    );
                  },
                );
        },
      ),
    );
  }
}
