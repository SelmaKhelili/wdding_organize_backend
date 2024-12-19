import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zefeffete/data_to_be_deleted/users.dart';

class ChangePasswordProfile extends StatefulWidget {
  static const String pageroute = '/changepasswordprofile';
  const ChangePasswordProfile({super.key});

  @override
  State<ChangePasswordProfile> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordProfile> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController codeController = TextEditingController();

  final _changePasswordFormKey = GlobalKey<FormState>();

  void _saveChangePassword(String email, String newPassword) {
    if (!_changePasswordFormKey.currentState!.validate()) {
      return; // Stop if form validation fails
    }

    if (users.containsKey(email)) {
      // Update the user's password
      final userData = users[email];
      userData!['password'] = newPassword;
      users[email] = userData;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String currentUserEmail =
        ModalRoute.of(context)?.settings.arguments as String? ??
            'unknown@domain.com';

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
            tooltip: 'Back',
          ),
          title: Text(
            'Security',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DefaultTextStyle(
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                  child: Form(
                    key: _changePasswordFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Change Password',
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Enter your new password'),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 181, 88, 139),
                                width: 2.0,
                              ),
                            ),
                            labelText: 'New Password',
                            labelStyle: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 103, 102, 103),
                            ),
                            hintText: 'Enter new password',
                            filled: true,
                            fillColor: const Color.fromARGB(92, 255, 207, 247),
                          ),
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Password cannot be empty';
                            }
                            if (password.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 181, 88, 139),
                                width: 2.0,
                              ),
                            ),
                            labelText: 'Confirm Password',
                            labelStyle: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 103, 102, 103),
                            ),
                            hintText: 'Re-enter new password',
                            filled: true,
                            fillColor: const Color.fromARGB(92, 255, 207, 247),
                          ),
                          validator: (confirmPassword) {
                            if (confirmPassword != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: codeController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 181, 88, 139),
                                width: 2.0,
                              ),
                            ),
                            labelText: 'Verification Code',
                            labelStyle: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 103, 102, 103),
                            ),
                            hintText: 'Enter verification code',
                            filled: true,
                            fillColor: const Color.fromARGB(92, 255, 207, 247),
                          ),
                          validator: (code) {
                            if (code == null || code.isEmpty) {
                              return 'Verification code is required';
                            }
                            // Additional code validation logic can go here
                            return null;
                          },
                        ),
                        const SizedBox(height: 26),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Haven’t received your code? ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Resend verification code logic
                                // ignore: avoid_print
                                print('Resend verification code');
                              },
                              child: const Text(
                                'Resend',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 158, 4, 86),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 26),
                        ElevatedButton(
                          onPressed: () {
                            _saveChangePassword(
                                currentUserEmail, passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 235, 118, 157),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: Text(
                            'Confirm',
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
