import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zefeffete/data_to_be_deleted/users.dart';
import 'package:zefeffete/presentation/views/screens/profile/profile.dart';

class EditprofileVendor extends StatefulWidget {
  static const String pageroute = '/editprofilevendor';

  const EditprofileVendor({super.key});

  @override
  State<EditprofileVendor> createState() => _EditprofileVendorState();
}

void _saveEdit(Map<String, dynamic> newUserData, String currentUserEmail) {
  // Cast the dynamic map to a Map<String, String> if needed
  Map<String, String> castedUserData = {
    'name': newUserData['name'] as String,
    'nickname': newUserData['nickname'] as String,
    'wilaya': newUserData['wilaya'] as String,
    'gender': newUserData['gender'] as String,
    'about': newUserData['about'] as String,
    'profession': newUserData['profession'] as String,
    'price': newUserData['price'] as String,
  };

  // Save the casted data
  users[currentUserEmail] = castedUserData;
}

class _EditprofileVendorState extends State<EditprofileVendor> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  bool showVendor = false;
  bool showVenue = false;
  final int maxTextLength = 100;
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _pricingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String currentUserEmail =
        ModalRoute.of(context)?.settings.arguments as String? ??
            'unknown@domain.com';
    // Retrieve the user's data from the map.
    final userData = users[currentUserEmail];

    bool isVendor = userData?['role'] == 'vendor';
    bool isVenue = userData?['role'] == 'venue';

    String? selectedWilaya = '';
    String? selectedGender = '';
    String? selectedProfession = '';
    String? selectedPricing = '';

    String? fullName = userData?['name'];
    String? nickname = userData?['nickname'];

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
                    fullName = value ?? userData?['name'];
                  },
                ),
                const SizedBox(height: 15),

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
                    nickname = value ?? userData?['nickname'];
                  },
                ),
                const SizedBox(height: 15),

                TextField(
                  controller: _aboutController,
                  maxLength: maxTextLength,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "About me",
                    hintText: "Write something about yourself...",
                    filled: true,
                    fillColor: const Color.fromARGB(
                        92, 255, 207, 247), // Background color
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(
                            255, 181, 88, 139), // Border color when focused
                        width: 2,
                      ),
                    ),
                  ),
                ),
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
                    const SizedBox(width: 15),

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
                const SizedBox(height: 5),

                Visibility(
                  visible: isVendor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Add myself as Vendor"),
                      Switch(
                        value: showVendor,
                        activeColor: const Color.fromARGB(255, 158, 4, 86),
                        onChanged: (value) {
                          setState(() {
                            showVendor = value;
                            print('Vendor toggled: $showVendor');
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),

                // Separate visibility for venue
                Visibility(
                  visible: isVenue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Add my venue"),
                      Switch(
                        value: showVenue,
                        activeColor: const Color.fromARGB(255, 158, 4, 86),
                        onChanged: (value) {
                          setState(() {
                            showVenue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                Visibility(
                  visible: showVendor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                                labelText: 'Profession',
                                labelStyle: GoogleFonts.poppins(
                                  color:
                                      const Color.fromARGB(255, 103, 102, 103),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(92, 255, 207, 247),
                              ),
                              items: const [
                                DropdownMenuItem(
                                    value: 'Photographer',
                                    child: Text('Photographer')),
                                DropdownMenuItem(
                                    value: 'Dj', child: Text('Dj')),
                                DropdownMenuItem(
                                    value: 'Chef', child: Text('Chef')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedProfession = value ?? 'none';
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
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
                                labelText: 'Range[min-max]',
                                labelStyle: GoogleFonts.poppins(
                                  color:
                                      const Color.fromARGB(255, 103, 102, 103),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(92, 255, 207, 247),
                              ),
                              items: const [
                                DropdownMenuItem(
                                    value: '[0-5000]', child: Text('[0-5000]')),
                                DropdownMenuItem(
                                    value: '[5000-10000]',
                                    child: Text('[5000-10000]')),
                                DropdownMenuItem(
                                    value: '[10000-15000]',
                                    child: Text('[10000-15000]')),
                                DropdownMenuItem(
                                    value: '[20000-25000]',
                                    child: Text('[20000-25000]')),
                                DropdownMenuItem(
                                    value: '[25000-30000]',
                                    child: Text('[25000-30000]')),
                                DropdownMenuItem(
                                    value: '[ > 30000]',
                                    child: Text('[ > 30000]')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedPricing = value ?? 'none';
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _pricingController,
                        maxLength: maxTextLength * 3,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: "Pricing details",
                          hintText: "Write your pricing details here...",
                          filled: true,
                          fillColor: const Color.fromARGB(
                              92, 255, 207, 247), // Background color
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 181, 88,
                                  139), // Border color when focused
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: showVenue,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                                  color:
                                      const Color.fromARGB(255, 103, 102, 103),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(92, 255, 207, 247),
                              ),
                              items: const [
                                DropdownMenuItem(
                                    value: 'Algiers', child: Text('Algiers')),
                                DropdownMenuItem(
                                    value: 'Oran', child: Text('Oran')),
                                DropdownMenuItem(
                                    value: 'Constantine',
                                    child: Text('Constantine')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedWilaya = value ?? 'none';
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
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
                                labelText: 'Range[min-max]',
                                labelStyle: GoogleFonts.poppins(
                                  color:
                                      const Color.fromARGB(255, 103, 102, 103),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(92, 255, 207, 247),
                              ),
                              items: const [
                                DropdownMenuItem(
                                    value: '[0-5000]', child: Text('[0-5000]')),
                                DropdownMenuItem(
                                    value: '[5000-10000]',
                                    child: Text('[5000-10000]')),
                                DropdownMenuItem(
                                    value: '[10000-15000]',
                                    child: Text('[10000-15000]')),
                                DropdownMenuItem(
                                    value: '[20000-25000]',
                                    child: Text('[20000-25000]')),
                                DropdownMenuItem(
                                    value: '[25000-30000]',
                                    child: Text('[25000-30000]')),
                                DropdownMenuItem(
                                    value: '[ > 30000]',
                                    child: Text('[ > 30000]')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedPricing = value ?? 'none';
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          // Add your picture upload logic here
                          print('Picture icon tapped');
                          // For example, you can integrate image picker here.
                        },
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                                92, 255, 207, 247), // Background color
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                            border: Border.all(
                              color: const Color.fromARGB(
                                  255, 181, 88, 139), // Border color
                              width: 2,
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.image, // Picture icon
                                color: Color.fromARGB(255, 181, 88, 139),
                              ),
                              SizedBox(width: 6), // Space between icon and text
                              Text(
                                'Include cover or pictures',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 103, 102, 103),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _pricingController,
                        maxLength: maxTextLength * 3,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: "Pricing details",
                          hintText: "Write your pricing details here...",
                          filled: true,
                          fillColor: const Color.fromARGB(
                              92, 255, 207, 247), // Background color
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 181, 88,
                                  139), // Border color when focused
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      final updatedUserData = {
                        'name': fullName,
                        'nickname': nickname,
                        'about': _aboutController.text,
                        'pricingdetails': _pricingController.text,
                        'price': selectedPricing,
                        'profession': selectedProfession,
                        'wilaya': selectedWilaya,
                        'gender': selectedGender,
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
                      fontWeight: FontWeight.normal,
                    ),
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
