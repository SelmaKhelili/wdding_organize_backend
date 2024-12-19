import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zefeffete/data/datasources/account_ds.dart';
import 'package:zefeffete/data/repositories/account_rep_impl.dart';
import 'package:zefeffete/domain/usecases/login_toaccount_usecase.dart';
import 'package:zefeffete/presentation/controllers/login_to_account_controller.dart';
import 'package:zefeffete/presentation/views/screens/auth/signup.dart';
import 'package:zefeffete/presentation/views/screens/auth/changepassword.dart';
import 'package:zefeffete/presentation/views/screens/profile/profile.dart';

class Login extends StatefulWidget {
  static const String pageroute = '/login';

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _loginemailController = TextEditingController();
  final TextEditingController _loginpasswordController = TextEditingController();
  final GlobalKey<FormState> _loginformkey = GlobalKey<FormState>();
  bool isObscurelogin = true;
  bool _isLoading = false;

  late final LoginController _loginController;

  @override
  void initState() {
    super.initState();

    // Initialize the controller with the use case
    final accountRepository = AccountRepositoryImpl(AccountDataSource());
    final loginUseCase = LoginUseCase(accountRepository);
    _loginController = LoginController(loginUseCase);
  }

  // Perform login validation
  void _login() async {
    if (_loginformkey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true; // Show loading indicator while processing login
      });

      String result = await _loginController.login(
        _loginemailController.text,
        _loginpasswordController.text,
      );

      setState(() {
        _isLoading = false; // Stop the loading indicator
      });
      
       if (result == "Login successful") {
        // Navigate to Profile page on success
        Navigator.pushNamed(context, Profile.pageroute, arguments: _loginemailController.text);
      } else {
        // Show error dialog on failure
        _showErrorDialog(result);
      }
    }
  }

  // Function to show an error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 90),
                  child: Text(
                    'Welcome!',
                    style: GoogleFonts.jomhuria(
                      fontSize: 80,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 234, 186, 210),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 249, 234, 242),
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
                            'Login Now',
                            style: GoogleFonts.raleway(
                              fontSize: 25,
                              color: const Color.fromARGB(255, 181, 88, 139),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Form(
                          key: _loginformkey,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 50),
                                const Text('    Email Address'),
                                const SizedBox(height: 2),
                                TextFormField(
                                  controller: _loginemailController,
                                  validator: (email) {
                                    if (email == null || email.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!email.contains('@') || !email.contains('.')) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    hintText: 'Enter Email ID',
                                    hintStyle: GoogleFonts.poppins(color: const Color.fromARGB(255, 123, 123, 123)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 181, 88, 139),
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
                                  obscureText: isObscurelogin,
                                  controller: _loginpasswordController,
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    hintText: 'Enter Password',
                                    hintStyle: GoogleFonts.poppins(color: const Color.fromARGB(255, 103, 102, 103)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 181, 88, 139),
                                        width: 2.0,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isObscurelogin ? Icons.visibility_off : Icons.visibility,
                                        color: const Color.fromARGB(255, 123, 123, 123),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isObscurelogin = !isObscurelogin;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Center(
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, Changepassword.pageroute);
                                        },
                                        child: const Text(
                                          'Forgot password?',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: _login,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(255, 196, 120, 158),
                                          minimumSize: const Size(250, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                        ),
                                        child: _isLoading
                                            ? CircularProgressIndicator()
                                            : Text(
                                                'Login',
                                                style: GoogleFonts.raleway(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 24, fontWeight: FontWeight.normal),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('You do not have an account? '),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, Signup.pageroute);
                                      },
                                      child: const Text(
                                        'Signup',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
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
      ),
    );
  }
}
