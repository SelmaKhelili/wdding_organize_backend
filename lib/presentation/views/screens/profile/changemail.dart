import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zefeffete/data_to_be_deleted/users.dart';

class Changemail extends StatefulWidget {
  static const String pageroute = '/changemail';

  const Changemail({super.key});

  @override
  State<Changemail> createState() => _ChangemailState();
}

class _ChangemailState extends State<Changemail> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  final _changemailformKey = GlobalKey<FormState>();

  void _saveChangemail(String currentUserEmail, String newEmail) {
    if (!_changemailformKey.currentState!.validate()) {
      return; // Stop if form validation fails
    }

    if (users.containsKey(currentUserEmail)) {
      final userData = users[currentUserEmail];
      users.remove(currentUserEmail);
      users[newEmail] = userData!;
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DefaultTextStyle(
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
            ),
            child: Form(
              key: _changemailformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change Email',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Enter your new email'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: emailController,
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
                      labelText: 'Email Address',
                      labelStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 103, 102, 103),
                      ),
                      hintText: 'Enter email',
                      hintStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(92, 255, 207, 247),
                    ),
                    validator: (email) {
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                      if (!emailRegex.hasMatch(email ?? '')) {
                        return 'Please enter a valid email';
                      }
                      if (users.containsKey(email)) {
                        return 'Email address already in use';
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
                      labelText: 'Code',
                      labelStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 103, 102, 103),
                      ),
                      hintText: 'Verification code',
                      hintStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(92, 255, 207, 247),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the verification code';
                      }
                      // Add additional validation if needed
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
                          // Resend the code
                        },
                        child: const Text(
                          'Resend',
                          style: TextStyle(
                            color: Color.fromARGB(255, 158, 4, 86),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 26),
                  ElevatedButton(
                    onPressed: () {
                      _saveChangemail(
                          currentUserEmail, emailController.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 235, 118, 157),
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
      ),
    );
  }
}
