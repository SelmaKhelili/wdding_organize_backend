import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/screens/auth/login.dart';
import 'package:zefeffete/presentation/views/screens/auth/signup.dart';
import 'package:zefeffete/presentation/views/screens/guests/views/GuestsPage.dart';
import 'package:zefeffete/presentation/views/screens/Home/homepage.dart';
import 'package:zefeffete/presentation/views/screens/liked_vendors/LikedVendorsPage.dart';
import 'package:zefeffete/presentation/views/screens/profile/profile.dart';
import 'package:zefeffete/presentation/views/screens/vendors/views/Vendors.dart';
import 'package:zefeffete/presentation/views/screens/venues/Venues.dart';
import 'package:zefeffete/presentation/views/screens/Home/onboardingPages.dart';
import 'package:zefeffete/presentation/views/screens/Home/homepage0.dart';
import 'package:zefeffete/presentation/views/screens/auth/loginrequired.dart';
import 'package:zefeffete/presentation/views/screens/auth/changepassword.dart';
import 'package:zefeffete/presentation/views/screens/auth/privacypolicy.dart';
import 'package:zefeffete/presentation/views/screens/profile/editprofile.dart';
import 'package:zefeffete/presentation/views/screens/profile/editprofilevendor.dart';
import 'package:zefeffete/presentation/views/screens/profile/security.dart';
import 'package:zefeffete/presentation/views/screens/profile/changemail.dart';
import 'package:zefeffete/presentation/views/screens/profile/changepassword.dart';
import 'package:zefeffete/presentation/views/screens/profile/changenumber.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingPages(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/venues': (context) => const Venues(),
        '/likedVendors': (context) => const LikedVendorsPage(),
        '/guestsList': (context) => const GuestsPageContent(),
        '/vendors': (context) => const VendorsPage(),
        '/profile': (context) => const Profile(),
        '/home0': (context) => const HomeScreen0(),
        '/loginrequired': (context) => const LoginRequiredScreen(),
        Login.pageroute: (context) => const Login(),
        Signup.pageroute: (context) => const Signup(),
        Editprofile.pageroute: (ctx) => const Editprofile(),
        EditprofileVendor.pageroute: (ctx) => const EditprofileVendor(),
        Security.pageroute: (ctx) => const Security(),
        Changemail.pageroute: (ctx) => const Changemail(),
        ChangePasswordProfile.pageroute: (ctx) => const ChangePasswordProfile(),
        ChangePhone.pageroute: (ctx) => const ChangePhone(),
        Changepassword.pageroute: (ctx) => const Changepassword(),
        PrivacyPolicyScreen.pageroute: (ctx) => const PrivacyPolicyScreen(),
      },
    );
  }
}
