import 'package:flutter/material.dart';
import 'package:zefeffete/presentation/views/themes/simpleStyle.dart/colors.dart';

class AddGuest extends StatefulWidget {
  const AddGuest({super.key});

  @override
  _AddGuestState createState() => _AddGuestState();
}

class _AddGuestState extends State<AddGuest> {
  // State variables for text inputs
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // State variables for toggle buttons
  String gender = "Male"; // Male or Female
  String side = "Groom's side"; // Groom's side or Bride's side

  // State variables for dropdown selections
  int numWomen = 0;
  int numMen = 0;
  int numKids = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary2,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDECEF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Add a new guest",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            //fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              // Name and Last Name Inputs
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Surname",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Gender Selection
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gender == "Male"
                            ? AppColors.primary2
                            : Colors.white,
                        side: const BorderSide(
                            color: Color.fromARGB(255, 151, 142, 142)),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          gender = "Male";
                        });
                      },
                      child: Text(
                        "Male",
                        style: TextStyle(
                          color: gender == "Male"
                              ? Colors.white
                              : const Color.fromARGB(255, 151, 142, 142),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gender == "Female"
                            ? AppColors.primary2
                            : Colors.white,
                        side: const BorderSide(
                            color: Color.fromARGB(255, 151, 142, 142)),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          gender = "Female";
                        });
                      },
                      child: Text(
                        "Female",
                        style: TextStyle(
                          color: gender == "Female"
                              ? Colors.white
                              : const Color.fromARGB(255, 151, 142, 142),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Side Selection
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: side == "Groom's side"
                            ? AppColors.primary2
                            : Colors.white,
                        side: const BorderSide(
                            color: Color.fromARGB(255, 151, 142, 142)),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          side = "Groom's side";
                        });
                      },
                      child: Text(
                        "Groom's side",
                        style: TextStyle(
                          color: side == "Groom's side"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: side == "Bride's side"
                            ? AppColors.primary2
                            : Colors.white,
                        side: const BorderSide(
                            color: Color.fromARGB(255, 151, 142, 142)),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          side = "Bride's side";
                        });
                      },
                      child: Text(
                        "Bride's side",
                        style: TextStyle(
                          color: side == "Bride's side"
                              ? Colors.white
                              : const Color.fromARGB(255, 151, 142, 142),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Companions Section
              const Text(
                "Companions:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 35),

              // Dropdowns for Number of Women, Men, and Kids
              DropdownButtonFormField<int>(
                value: numWomen,
                items: List.generate(11, (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text(index.toString()),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    numWomen = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Number of women",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              DropdownButtonFormField<int>(
                value: numMen,
                items: List.generate(11, (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text(index.toString()),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    numMen = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Number of men",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              DropdownButtonFormField<int>(
                value: numKids,
                items: List.generate(11, (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text(index.toString()),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    numKids = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Number of kids",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
