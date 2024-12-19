import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/widgets/bottomNavigationBar.dart';
import 'package:zefeffete/presentation/views/widgets/appbar.dart';
import 'package:zefeffete/presentation/views/widgets/countDown.dart';
import 'package:zefeffete/presentation/views/widgets/bestVenues.dart';
import 'package:zefeffete/presentation/views/widgets/popularVendors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Appbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CountDown(),
            SizedBox(height: 30),
            BestVenues(),
            PopularVendors()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentRoute: '/home'),
    );
  }
}
