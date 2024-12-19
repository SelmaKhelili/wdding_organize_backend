import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zefeffete/data_to_be_deleted/users.dart';
import 'package:zefeffete/presentation/views/screens/profile/profile.dart';

class Editprofile extends StatefulWidget {
  static const String pageroute = '/editprofile';

  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

void _saveEdit(Map<String, dynamic> newUserData, String currentUserEmail) {
  // Cast the dynamic map to a Map<String, String> if needed
  Map<String, String> castedUserData = {
    'name': newUserData['name'] as String,
    'nickname': newUserData['nickname'] as String,
    'partnername': newUserData['partnername'] as String,
    'wilaya': newUserData['wilaya'] as String,
    'gender': newUserData['gender'] as String,
    'weddingdate': newUserData['weddingdate'] as String? ?? '',
  };

  // Save the casted data
  users[currentUserEmail] = castedUserData;
}

class _EditprofileState extends State<Editprofile> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    final String currentUserEmail =
        ModalRoute.of(context)?.settings.arguments as String? ??
            'unknown@domain.com';
    // Retrieve the user's data from the map.
    final userData = users[currentUserEmail];
    String? selectedYear;
    String? selectedMonth;
    String? selectedDay;
    String? selectedWilaya = '';
    String? selectedGender = '';
    String? fullName = userData?['name'];
    String? nickname = userData?['nickname'];
    String? partner = userData?['partnername'];

    final List<String> years = ['2025', '2026', '2027', '2028'];
    final List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    final List<String> days = [
      '01',
      '02',
      '03',
      '04',
      '05',
      '06',
      '07',
      '08',
      '09',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey, // Assign form key
            child: Column(
              children: [
                // Full name field with validation
                TextFormField(
                  initialValue: fullName,
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
                    labelText: 'Full name',
                    labelStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 103, 102, 103),
                    ),
                    hintText: userData?['name'],
                    hintStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(92, 255, 207, 247),
                  ),
                  onSaved: (value) {
                    fullName = value;
                  },
                ),
                const SizedBox(height: 26),

                // Nickname field with validation
                TextFormField(
                  initialValue: nickname,
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
                    labelText: 'Nick name',
                    labelStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 103, 102, 103),
                    ),
                    hintText: userData?['nickname'],
                    hintStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(92, 255, 207, 247),
                  ),
                  onSaved: (value) {
                    nickname = value;
                  },
                ),
                const SizedBox(height: 26),

                Row(
                  children: [
                    // Wilaya Dropdown
                    Expanded(
                      child: DropdownButtonFormField<String>(
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
                          labelText: 'Wilaya',
                          labelStyle: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 103, 102, 103),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(92, 255, 207, 247),
                        ),
                        items: const [
                          DropdownMenuItem(
                              value: 'Algiers', child: Text('Algiers')),
                          DropdownMenuItem(value: 'Oran', child: Text('Oran')),
                          DropdownMenuItem(
                              value: 'Constantine', child: Text('Constantine')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedWilaya = value ?? 'none';
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 26),

                    // Gender Dropdown
                    Expanded(
                      child: DropdownButtonFormField<String>(
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
                          labelText: 'Gender',
                          labelStyle: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 103, 102, 103),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(92, 255, 207, 247),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'Male', child: Text('Male')),
                          DropdownMenuItem(
                              value: 'Female', child: Text('Female')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value ?? 'none';
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),

                // Partner field
                TextFormField(
                  initialValue: partner,
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
                    labelText: 'Partner',
                    labelStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 103, 102, 103),
                    ),
                    hintText: userData?['partnername'] ?? 'Unknown Partner',
                    hintStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(95, 255, 207, 247),
                  ),
                  onSaved: (value) {
                    partner = value;
                  },
                ),
                const SizedBox(height: 26),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Year Dropdown
                    SizedBox(
                      width: 90,
                      child: DropdownButtonFormField<String>(
                        value: selectedYear,
                        decoration: InputDecoration(
                          labelText: 'Year',
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 181, 88, 139),
                              width: 2.0,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(92, 255, 207, 247),
                        ),
                        items: years
                            .map((year) => DropdownMenuItem(
                                  value: year,
                                  child: Text(year),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedYear = value;
                          });
                        },
                      ),
                    ),

                    // Month Dropdown
                    SizedBox(
                      width: 150,
                      child: DropdownButtonFormField<String>(
                        value: selectedMonth,
                        decoration: InputDecoration(
                          labelText: 'Month',
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 181, 88, 139),
                              width: 2.0,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(92, 255, 207, 247),
                        ),
                        items: months
                            .map((month) => DropdownMenuItem(
                                  value: month,
                                  child: Text(month),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMonth = value;
                          });
                        },
                      ),
                    ),

                    // Day Dropdown
                    SizedBox(
                      width: 70,
                      child: DropdownButtonFormField<String>(
                        value: selectedDay,
                        decoration: InputDecoration(
                          labelText: 'Day',
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 181, 88, 139),
                              width: 2.0,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(92, 255, 207, 247),
                        ),
                        items: days
                            .map((day) => DropdownMenuItem(
                                  value: day,
                                  child: Text(day),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDay = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 46),

                // Save button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      final updatedUserData = {
                        'name': fullName,
                        'nickname': nickname,
                        'partnername': partner,
                        'wilaya': selectedWilaya,
                        'gender': selectedGender,
                        'weddingdate':
                            '$selectedDay $selectedMonth $selectedYear'
                      };
                      _saveEdit(updatedUserData, currentUserEmail);
                    }
                    Navigator.pushNamed(context, Profile.pageroute,
                        arguments: currentUserEmail);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 235, 118, 157),
                    minimumSize: const Size(300, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
