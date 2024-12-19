import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  static const String pageroute = '/PrivacyPolicy';

  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Color.fromARGB(255, 197, 120, 159),
          ),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: Text(
          'Privacy Policy',
          style: GoogleFonts.jomhuria(
            fontSize: 40, 
            fontWeight: FontWeight.w500, 
            color: const Color.fromARGB(255, 197, 120, 159),
          ),
        ),
        backgroundColor: Colors.white, 
        elevation: 0, 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Your privacy is important to us. Please read the following policies carefully.',
              style: GoogleFonts.raleway(
                fontSize: 18,
                color: const Color.fromARGB(255, 85, 85, 85), 
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '1. Types of data we collect',
              style: GoogleFonts.raleway(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 181, 88, 139),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  Text(
                    'We collect certain types of data to help make your wedding planning experience smooth and personalized. This includes:',
                    style: GoogleFonts.raleway(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• Personal Information: Such as your name, contact details, wedding date, and preferences for services like venues, DJs, photographers, and catering options.',
                    style: GoogleFonts.raleway(
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• Event Details: Information about your wedding venue, guest count, budget range, and other preferences.',
                    style: GoogleFonts.raleway(
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• Interaction Data: Information about how you interact with our app, such as which services you view, to offer more personalized recommendations.',
                    style: GoogleFonts.raleway(
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• Payment Information: If you choose to book a service through our app, we may collect payment details to process transactions.',
                    style: GoogleFonts.raleway(
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Text(
              '2. Use of your personal data',
              style: GoogleFonts.raleway(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                 color: const Color.fromARGB(255, 181, 88, 139),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  Text(
                    'We use the data we collect to provide and improve our wedding planning services:',
                    style: GoogleFonts.raleway(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• Personalization: To tailor recommendations to your wedding needs, including venues, DJs, photographers, and chefs that match your style and budget.',
                    style: GoogleFonts.raleway(
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• Communication: To send you updates, reminders, and important information related to your wedding planning progress, and respond to any inquiries.',
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• Payment Processing: For any payments made through our app, we use your information to securely process transactions.',
                    style: GoogleFonts.raleway(
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Text(
              '3. Disclosure of your personal data',
              style: GoogleFonts.raleway(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 181, 88, 139),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  Text(
                    'We respect your privacy and only share your information as necessary to provide our services. This may include:',
                    style: GoogleFonts.raleway(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• With Service Providers: Such as venues, DJs, photographers, and chefs, when you request information, quotes, or make a booking.',
                    style: GoogleFonts.raleway(
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• With Payment Processors: For securely handling payment transactions.',
                    style: GoogleFonts.raleway(
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• Legal Obligations: We may disclose information if required by law, such as in response to a legal request, or to protect our rights and safety.',
                    style: GoogleFonts.raleway(
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 85, 85, 85), 
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  Text(
                    'Your data is handled securely, and we have strict measures in place to ensure your privacy and prevent unauthorized access. We strive to ensure that any third parties we work with adhere to the same standards.',
                    style: GoogleFonts.raleway(
                      fontSize: 16, 
                      color: const Color.fromARGB(255, 85, 85, 85),
                    ),
                  ),
            const SizedBox(height: 30),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
