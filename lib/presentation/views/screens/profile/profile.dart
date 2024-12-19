import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/screens/profile/security.dart';
import 'package:zefeffete/presentation/views/widgets/bottomNavigationBar.dart';
import 'package:zefeffete/data_to_be_deleted/users.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zefeffete/presentation/views/screens/auth/privacypolicy.dart';
import 'package:zefeffete/presentation/views/screens/profile/editprofile.dart';
import 'package:zefeffete/presentation/views/screens/profile/editprofilevendor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:math' as math;

class Profile extends StatefulWidget {
  static const String pageroute = '/profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

Future<String?> getEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('Email'); // Returns null if 'Email' is not set
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.pink;

    canvas.drawArc(
      Rect.fromLTWH(
        -30,
        -size.height,
        size.width + 60,
        size.height * 2,
      ),
      0,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _ProfileState extends State<Profile> {
  String? currentUserEmail;

  @override
  void initState() {
    super.initState();
    loadEmail();
  }

  Future<void> loadEmail() async {
    final email = await getEmail();
    setState(() {
      currentUserEmail = email;
    });
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('Email');
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the user's data from the map.
    final userData = users[currentUserEmail] ?? {};
    bool about = userData['role'] != 'weddingowner';

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0, // Position at the very top
              left: 0,
              right: 0,
              child: CustomPaint(
                painter: MyPainter(),
                size: Size(MediaQuery.of(context).size.width,
                    200), // Adjust arc height here
              ),
            ),
            DefaultTextStyle(
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                const CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                      'assets/images/profilepic.png'),
                                ),
                                SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    Text(
                                      userData['nickname'] ?? 'Unknown User',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                    Text(
                                      '$currentUserEmail | ${userData['phone number'] ?? 'Unknown Phone'}',
                                    ),
                                    SingleChildScrollView(
                                      child: Visibility(
                                        visible: about,
                                        child: Text(
                                          ' ${userData['about'] ?? 'Write something about yourself'}',
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            Positioned(
                              top: 50,
                              right: 70,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 245, 245, 245),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.edit_outlined,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    if (about == true) {
                                      Navigator.pushNamed(
                                          context, EditprofileVendor.pageroute,
                                          arguments: currentUserEmail);
                                    }
                                    if (about == false) {
                                      Navigator.pushNamed(
                                          context, Editprofile.pageroute,
                                          arguments: currentUserEmail);
                                    }
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize
                                          .max, // This ensures the Row takes up full width
                                      children: [
                                        Icon(Icons.perm_identity),
                                        Text('  Edit profile information'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to notifications page
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(Icons.notifications_none_outlined),
                                        Text('  Notifications'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16, bottom: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to language settings page
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(Icons.translate),
                                        Text('  Language'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Security.pageroute,
                                        arguments: currentUserEmail);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(Icons.security_outlined),
                                        Text('  Security'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16, bottom: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to theme settings page
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(Icons.collections_outlined),
                                        Text('  Theme'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to help & support page
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(Icons.help_center_outlined),
                                        Text('  Help & Support'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to contact us page
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(Icons.messenger_outline),
                                        Text('  Contact us'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16, bottom: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, PrivacyPolicyScreen.pageroute);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(Icons.lock_outline),
                                        Text('  Privacy Policy'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                )),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
          currentRoute: '/profile'), // Use the BottomNavBar here
    );
  }
}
