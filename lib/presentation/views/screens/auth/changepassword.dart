import 'package:flutter/material.dart';
import 'package:zefeffete/data_to_be_deleted/users.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zefeffete/presentation/views/screens/auth/login.dart';

class Changepassword extends StatefulWidget {
  static const String pageroute = '/Changepassword';

  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final TextEditingController changepasswordController =
      TextEditingController();
  final TextEditingController changepasswordemailController =
      TextEditingController();
  final TextEditingController confirmChangepasswordController =
      TextEditingController();
  final GlobalKey<FormState> _changePasswordformkey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
  }

  void _changePassword(String password) {
    if (_changePasswordformkey.currentState?.validate() ?? false) {
      users[changepasswordemailController.text]?['password'] = password;
      // ignore: avoid_print
      print('change password successful');
      if (mounted) {
        Navigator.pushNamed(context, Login.pageroute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          // Background image

          // Main content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    weight: 5.0,
                  ),
                  color: const Color.fromARGB(255, 197, 120, 159),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  'Welcome!',
                  style: GoogleFonts.jomhuria(
                    fontSize: 80,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 234, 186, 210),
                  ),
                ),
              ),

              // New container including Login Now and the form
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(
                      255, 249, 234, 242), // Light pink background
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: DefaultTextStyle(
                  style: GoogleFonts.raleway(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Change password',
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 181, 88, 139),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Form container
                      Form(
                        key: _changePasswordformkey,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(
                                255, 234, 186, 210), // Background color
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 50),
                                const Text('    Email Address'),
                                const SizedBox(height: 2),
                                TextFormField(
                                  controller: changepasswordemailController,
                                  validator: (email) {
                                    if (email == null || email.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!email.contains('@') ||
                                        !email.contains('.')) {
                                      return 'Please enter a valid email';
                                    }
                                    if (!users.containsKey(email)) {
                                      return 'This email is not registered';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    hintText: 'Enter Email ID',
                                    hintStyle: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 123, 123, 123)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 181, 88, 139),
                                        width: 2.0,
                                      ),
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.email,
                                      color: Color.fromARGB(255, 123, 123, 123),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const Text('    Password'),
                                const SizedBox(height: 2),
                                TextFormField(
                                  obscureText: isObscure,
                                  controller: changepasswordController,
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (password.length < 8) {
                                      return 'Password must be at least 8 characters';
                                    }
                                    return null; // If password is valid
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    hintText: 'Enter Password',
                                    hintStyle: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 123, 123, 123)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 181, 88, 139),
                                        width: 2.0,
                                      ),
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.lock_outlined,
                                      color: Color.fromARGB(255, 123, 123, 123),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                // Password input
                                const Text('    Confirm Password'),
                                const SizedBox(height: 2),
                                TextFormField(
                                  obscureText: isObscure,
                                  controller: confirmChangepasswordController,
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (password !=
                                        changepasswordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    hintText: 'Confirm Password',
                                    hintStyle: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 103, 102, 103)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 181, 88, 139),
                                        width: 2.0,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isObscure
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: const Color.fromARGB(
                                            255, 123, 123, 123),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isObscure = !isObscure;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Center(
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          _changePassword(
                                              confirmChangepasswordController
                                                  .text);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 196, 120, 158),
                                          minimumSize: const Size(250, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0), // Reduce the border radius to 15
                                          ),
                                        ),
                                        child: Text(
                                          'Confirm',
                                          style: GoogleFonts.raleway(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 24,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 140,
            right: 10,
            child: Image.asset(
              'assets/images/flowers2.png',
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    ));
  }
}
