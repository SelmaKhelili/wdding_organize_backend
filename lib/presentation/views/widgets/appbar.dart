import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/homeStyle.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Welcome, ',
              style: welcomeMessage,
              children: [
                TextSpan(
                  text: 'Wafaa',
                  style: appName,
                ),
              ],
            ),
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
            radius: 20,
          ),
        ],
      ),
    );
  }
}
