import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zefeffete/data_to_be_deleted/users.dart';

class ChangePhone extends StatefulWidget {
  static const String pageroute = '/changephone';

  const ChangePhone({super.key});

  @override
  State<ChangePhone> createState() => _ChangePhoneState();
}

class _ChangePhoneState extends State<ChangePhone> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  final _changePhoneFormKey = GlobalKey<FormState>();

  void _saveChangePhone(String currentUserEmail, String newPhone) {
    if (!_changePhoneFormKey.currentState!.validate()) {
      return; // Stop if form validation fails
    }

    if (users.containsKey(currentUserEmail)) {
      final userData = users[currentUserEmail];
      userData!['phone'] = newPhone; // Save phone as string
      users[currentUserEmail] = userData;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    //ignore: avoid_print
    print('Building Change number');
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
              key: _changePhoneFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change Phone Number',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Enter your new phone number'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
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
                      labelText: 'Phone Number',
                      labelStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 103, 102, 103),
                      ),
                      hintText: 'Enter phone number',
                      hintStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(92, 255, 207, 247),
                    ),
                    validator: (phone) {
                      if (phone == null || phone.isEmpty) {
                        return 'Phone number cannot be empty';
                      }
                      if (phone.length != 10 || int.tryParse(phone) == null) {
                        return 'Phone number must be 10 digits long';
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
                      _saveChangePhone(
                          currentUserEmail, phoneController.text.trim());
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
