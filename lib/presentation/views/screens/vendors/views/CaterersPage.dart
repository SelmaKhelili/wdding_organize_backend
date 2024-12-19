import 'package:flutter/material.dart';
import '../../../widgets/AppSearchBar.dart';

class CaterersPage extends StatelessWidget {
  const CaterersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Padding(
          padding: EdgeInsets.only(top: 25, bottom: 20), child: AppSearchBar()),
      Center(
        child: Text(
          "Caterers",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
