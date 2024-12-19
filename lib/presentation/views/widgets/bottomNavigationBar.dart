/*

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatelessWidget {
  final String currentRoute;
  const BottomNavBar({Key? key, required this.currentRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      margin: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color.fromARGB(204, 248, 235, 242),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(context,
              icon: Icons.home, label: "Home", route: '/home'),
          _buildNavItem(context,
              icon: Icons.location_on, label: "Venues", route: '/venues'),
          _buildNavItem(context,
              icon: Icons.favorite_border,
              label: "liked vendors",
              route: '/likedVendors'),
          _buildNavItem(context,
              icon: Icons.group, label: "Guests", route: '/guestsList'),
          _buildNavItem(context,
              icon: Icons.menu, label: "Vendors", route: '/vendors'),
          _buildNavItem(context,
              icon: Icons.person, label: "Profile", route: '/profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required IconData icon, required String label, required String route}) {
    final isSelected = currentRoute == route;
    return GestureDetector(
      onTap: () async {
        if (!isSelected) {
          bool isLoggedIn = await _checkLoginStatus();
          if (isLoggedIn || route == '/home') {
            // Allow navigation if logged in or to the Home page
            Navigator.pushNamed(context, route);
          } else {
            // Redirect to the "login required" page
            Navigator.pushNamed(context, '/loginrequired');
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(153, 247, 117, 156)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Color.fromARGB(255, 158, 4, 86)
                  : Color.fromARGB(255, 247, 117, 156),
              size: 20,
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  label,
                  style: TextStyle(
                      color: Color.fromARGB(255, 158, 4, 86), fontSize: 10),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatelessWidget {
  final String currentRoute;
  const BottomNavBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      margin: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(204, 248, 235, 242),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(context,
              icon: Icons.home, label: "Home", route: '/home'),
          _buildNavItem(context,
              icon: Icons.location_on, label: "Venues", route: '/venues'),
          _buildNavItem(context,
              icon: Icons.favorite_border,
              label: "liked vendors",
              route: '/likedVendors'),
          _buildNavItem(context,
              icon: Icons.group, label: "Guests", route: '/guestsList'),
          _buildNavItem(context,
              icon: Icons.menu, label: "Vendors", route: '/vendors'),
          _buildNavItem(context,
              icon: Icons.person, label: "Profile", route: '/profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required IconData icon, required String label, required String route}) {
    final isSelected = currentRoute == route;

    return GestureDetector(
      onTap: () async {
        print('Tapped on $label with route $route'); // Debugging
        if (!isSelected) {
          if (route == '/vendors' || route == '/venues') {
            // Navigate directly to the Vendors or Venues page
            Navigator.pushNamed(context, route);
          } else {
            bool isLoggedIn = await _checkLoginStatus();
            print('Is user logged in: $isLoggedIn'); // Debugging
            if (isLoggedIn || route == '/home') {
              Navigator.pushNamed(context, route);
            } else {
              Navigator.pushNamed(context, '/loginrequired');
            }
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(153, 247, 117, 156)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color.fromARGB(255, 158, 4, 86)
                  : const Color.fromARGB(255, 247, 117, 156),
              size: 20,
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  label,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 158, 4, 86), fontSize: 10),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
*/

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatelessWidget {
  final String currentRoute;
  const BottomNavBar({Key? key, required this.currentRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      margin: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color.fromARGB(204, 248, 235, 242),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(context,
              icon: Icons.home, label: "Home", route: '/home'),
          _buildNavItem(context,
              icon: Icons.location_on, label: "Venues", route: '/venues'),
          _buildNavItem(context,
              icon: Icons.favorite_border,
              label: "liked vendors",
              route: '/likedVendors'),
          _buildNavItem(context,
              icon: Icons.group, label: "Guests", route: '/guestsList'),
          _buildNavItem(context,
              icon: Icons.menu, label: "Vendors", route: '/vendors'),
          _buildNavItem(context,
              icon: Icons.person, label: "Profile", route: '/profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required IconData icon, required String label, required String route}) {
    final isSelected = currentRoute == route;

    return GestureDetector(
      onTap: () async {
        print('Tapped on $label with route $route'); // Debugging
        if (!isSelected) {
          if (route == '/vendors' || route == '/venues') {
            // Navigate directly to the Vendors or Venues page
            Navigator.pushNamed(context, route);
          } else {
            bool isLoggedIn = await _checkLoginStatus();
            print('Is user logged in: $isLoggedIn'); // Debugging
            if (isLoggedIn || route == '/home') {
              Navigator.pushNamed(context, route);
            } else {
              Navigator.pushNamed(context, '/loginrequired');
            }
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(153, 247, 117, 156)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Color.fromARGB(255, 158, 4, 86)
                  : Color.fromARGB(255, 247, 117, 156),
              size: 20,
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  label,
                  style: TextStyle(
                      color: Color.fromARGB(255, 158, 4, 86), fontSize: 10),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
