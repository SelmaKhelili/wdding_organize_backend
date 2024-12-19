import 'package:flutter/material.dart';
import '../../../widgets/AppSearchBar.dart';

class DJsPage extends StatelessWidget {
  const DJsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Padding(
          padding: EdgeInsets.only(top: 25, bottom: 20), child: AppSearchBar()),
      Center(
        child: Text(
          "DJs Section",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
