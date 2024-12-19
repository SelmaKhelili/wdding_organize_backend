import '../widgets/GuestCard.dart';
import 'package:flutter/material.dart';
import 'AddGuest.dart';
import 'package:zefeffete/presentation/views/widgets/bottomNavigationBar.dart';

class GuestsPage extends StatelessWidget {
  const GuestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GuestsPageContent();
  }
}

class GuestsPageContent extends StatelessWidget {
  const GuestsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text("Guests List")),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Search Bar
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color.fromARGB(
                                  117, 83, 83, 82), // Border color
                              width: 2, // Border width
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: Color.fromARGB(117, 83, 83, 82),
                              ),
                              hintText: "Search by name",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),

                        Expanded(
                          child: ListView(
                            children: const [
                              GuestCard(
                                guestName: "Guest name",
                                gender: "female",
                                letter: "B",
                                wCount: 0,
                                mCount: 0,
                                kCount: 0,
                              ),
                              SizedBox(height: 30),
                              GuestCard(
                                guestName: "Guest name",
                                gender: "male",
                                letter: "G",
                                wCount: 0,
                                mCount: 0,
                                kCount: 0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddGuest()),
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC5789E),
                  ),
                  child: Center(
                    child: Transform.scale(
                      scale: 3,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentRoute: '/guestsList',
      ),
    );
  }
}
