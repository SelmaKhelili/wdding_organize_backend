import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zefeffete/data/datasources/account_ds.dart';
import 'package:zefeffete/data/datasources/vendor_ds.dart';
import 'package:zefeffete/data/datasources/wedding_owner_ds.dart';
import 'package:zefeffete/data/repositories/account_rep_impl.dart';
import 'package:zefeffete/data/repositories/vendor_rep_impl.dart';
import 'package:zefeffete/data/repositories/venue_owner_rep_impl.dart';
import 'package:zefeffete/data/repositories/wedding_owner_rep_impl.dart';
import 'package:zefeffete/domain/usecases/insert_account_usecase.dart';
import 'package:zefeffete/domain/usecases/vendor_usecases.dart';
import 'package:zefeffete/domain/usecases/venue_owner_usecase.dart';
import 'package:zefeffete/domain/usecases/wedding_owner_usecases.dart';
import 'package:zefeffete/presentation/controllers/account_signup_controller.dart';
import 'package:zefeffete/presentation/controllers/vendor_controller.dart';
import 'package:zefeffete/presentation/controllers/venue_owner.dart';
import 'package:zefeffete/presentation/controllers/wedding_owner_controller.dart';
import 'package:zefeffete/presentation/views/screens/auth/login.dart';
import 'package:zefeffete/presentation/views/screens/auth/privacypolicy.dart';

import '../../../../data/datasources/venue_owner_ds.dart';

class Signup extends StatefulWidget {
  static const String pageroute = '/signup';
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String role = 'wedding_owner';
  bool _isCheckboxError = false; // Track checkbox validation error
  bool _isAgreed = false; // Track whether the checkbox is checked
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final profilePicture = null;
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  bool isObscuresignup = true;

  final SignupController _signupController = SignupController(
  InsertAccountUseCase(
    accountRepository: AccountRepositoryImpl(AccountDataSource()), // Implement your account repository
    weddingOwnerController: WeddingOwnerController(WeddingOwnerUseCases(WeddingOwnerRepositoryImpl(WeddingOwnerDataSource()))),
    venueOwnerController: VenueOwnerController(VenueOwnerUseCases(VenueOwnerRepositoryImpl(VenueOwnerDataSource()))),
    vendorController: VendorController(VendorUseCases(VendorRepositoryImpl(VendorDataSource()))),
  ),
);


  void _register() async{
    if (_signupFormKey.currentState?.validate() ?? false) {

      final result = await _signupController.signup(
      email: _emailController.text,
      password: _passwordController.text,
      username:  _emailController.text.split('@')[0],
      profilePicture: profilePicture.isEmpty ? null : profilePicture, // Make profilePicture optional
      role: role,
    );

      setState(() {
        _isCheckboxError = !_isAgreed;
      });

      if (!_isAgreed ||
          _emailController.text.isEmpty ||
          _passwordController.text.isEmpty) {
        return;
      }
      if(result == "Signup successful")
      {
        // ignore: avoid_print
      print('Registration successful');
      Navigator.pushNamed(context, Login.pageroute,
          arguments: _emailController.text);
          }
          else{
            // ignore: avoid_print
            print('Registration failed');
          }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 50),
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
                  padding: const EdgeInsets.only(
                    left: 55.0,
                  ),
                  child: Text(
                    'Hello!',
                    style: GoogleFonts.jomhuria(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 234, 186, 210),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(
                          255, 249, 234, 242), // Set the background color here
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(16.0), // Set top-left corner radius
                        topRight: Radius.circular(
                            16.0), // Set top-right corner radius
                      ),
                    ),
                    child: DefaultTextStyle(
                      style: GoogleFonts.raleway(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.all(20.0), // left margin of 16
                            child: Text(
                              'Create a new account',
                              style: GoogleFonts.raleway(
                                fontSize: 25,
                                color: const Color.fromARGB(255, 181, 88, 139),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(234, 186, 210, 1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        16.0), // Set top-left corner radius
                                    topRight: Radius.circular(
                                        16.0), // Set top-right corner radius
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, right: 16.0),
                                        child: Form(
                                          key: _signupFormKey,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 10),
                                              const Text('    Email Address'),
                                              const SizedBox(height: 2),
                                              TextFormField(
                                                controller: _emailController,
                                                validator: (email) {
                                                  if (email == null ||
                                                      email.isEmpty) {
                                                    return 'Please enter your email';
                                                  }
                                                  if (!email.contains('@') ||
                                                      !email.contains('.')) {
                                                    return 'Please enter a valid email';
                                                  }

                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0), // Set the border radius here
                                                  ),
                                                  hintText: 'Enter Email ID',
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              123, 123, 123)),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0), // Keep the same border radius
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 181, 88, 139),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  suffixIcon: const Icon(
                                                    Icons
                                                        .email, // Use the email icon
                                                    color: Color.fromARGB(
                                                        255,
                                                        123,
                                                        123,
                                                        123), // Set the icon color
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              const Text('    Password'),
                                              const SizedBox(height: 2),
                                              TextFormField(
                                                obscureText: true,
                                                controller: _passwordController,
                                                validator: (password) {
                                                  if (password == null ||
                                                      password.isEmpty) {
                                                    return 'Please enter your password';
                                                  }
                                                  if (password.length < 8) {
                                                    return 'Password must be at least 8 characters';
                                                  }
                                                  return null; // If password is valid
                                                },
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0), // Set the border radius here
                                                  ),
                                                  hintText: 'Enter Password',
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              103, 102, 103)),
                                                  filled:
                                                      true, // Set the filled property to true
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0), // Keep the same border radius
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 181, 88, 139),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  suffixIcon: const Icon(
                                                    Icons
                                                        .lock, // Use the email icon
                                                    color: Color.fromARGB(
                                                        255,
                                                        123,
                                                        123,
                                                        123), // Set the icon color
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                  '    Confirm Password'),
                                              const SizedBox(height: 2),
                                              TextFormField(
                                                obscureText: isObscuresignup,
                                                controller:
                                                    _confirmPasswordController,
                                                validator: (password) {
                                                  if (password == null ||
                                                      password.isEmpty) {
                                                    return 'Please enter your password';
                                                  }
                                                  if (password !=
                                                      _passwordController
                                                          .text) {
                                                    return 'Passwords do not match';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0), // Set the border radius here
                                                  ),
                                                  hintText: 'Confirm Password',
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              103, 102, 103)),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0), // Keep the same border radius
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 181, 88, 139),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  suffixIcon: IconButton(
                                                    icon: Icon(
                                                      isObscuresignup
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              123,
                                                              123,
                                                              123),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        isObscuresignup =
                                                            !isObscuresignup;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                  '    Are you a vendor or a venue owner?'),
                                              const SizedBox(height: 2),
                                              DropdownButtonFormField<String>(
                                                value: role,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0), // Set the border radius here
                                                  ),
                                                  filled:
                                                      true, // Set the filled property to true
                                                  fillColor: Colors
                                                      .white, // Set the background color to white
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color.fromARGB(
                                                          255,
                                                          181,
                                                          88,
                                                          139), // Pink border when focused
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                                items: const [
                                                  DropdownMenuItem<String>(
                                                    value: 'wedding_owner',
                                                    child: SizedBox(
                                                      width: 100,
                                                      child: Text(
                                                        'Wedding owner',
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                103,
                                                                102,
                                                                103)), // Grey color text
                                                      ),
                                                    ),
                                                  ),
                                                  DropdownMenuItem<String>(
                                                    value: 'vendor',
                                                    child: SizedBox(
                                                      width:
                                                          100, // Adjust width to fit content
                                                      child: Text(
                                                        'Vendor',
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                103,
                                                                102,
                                                                103)), // Grey color text
                                                      ),
                                                    ),
                                                  ),
                                                  DropdownMenuItem<String>(
                                                    value: 'venue_owner',
                                                    child: SizedBox(
                                                      width:
                                                          100, // Adjust width to fit content
                                                      child: Text(
                                                        'Venue Owner',
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                103,
                                                                102,
                                                                103)), // Grey color text
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                onChanged: (value) {
                                                  setState(() {
                                                    role = value ??
                                                        'wedding_owner';
                                                  });
                                                },
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255,
                                                      105,
                                                      105,
                                                      105), // Text color when not selected
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16),
                                                    child: Checkbox(
                                                      value: _isAgreed,
                                                      onChanged:
                                                          (bool? newValue) {
                                                        setState(() {
                                                          _isAgreed =
                                                              newValue ?? false;
                                                          _isCheckboxError =
                                                              !_isAgreed;
                                                        });
                                                      },
                                                      side: const BorderSide(
                                                        color: Colors
                                                            .white, // Pink border when unchecked
                                                        width:
                                                            2.0, // Set the border width
                                                      ),
                                                      checkColor: Colors
                                                          .white, // White checkmark color when selected
                                                      activeColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              197,
                                                              120,
                                                              159),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          PrivacyPolicyScreen
                                                              .pageroute);
                                                    },
                                                    child: const Text(
                                                      'I agree to the privacy policy',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            197,
                                                            120,
                                                            159), // Blue text color to indicate it's a link
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              // Error message that shows if the checkbox is unchecked after clicking it
                                              if (_isCheckboxError)
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 16.0),
                                                  child: Text(
                                                    'You must agree to the privacy policy',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      _register();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              196,
                                                              120,
                                                              158),
                                                      minimumSize:
                                                          const Size(250, 50),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15.0), // Reduce the border radius to 15
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Register',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                      'You already have an account ? '),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          Login
                                                              .pageroute); // Navigate to login screen
                                                    },
                                                    child: const Text(
                                                      'Login',
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            255), // Adjust color as needed
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 25),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 170, // Adjust top to position the flower where you want it
              right: 1,
              child: Image.asset(
                'assets/images/flowers1.png',
                fit: BoxFit.cover,
                height:
                    120, // Adjust height to control the size of the flower image
              ),
            ),
          ],
        ),
      ),
    );
  }
}
