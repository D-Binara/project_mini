import 'package:chat/pages/community.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/store_page.dart';
import 'package:chat/pages/userprofile_page.dart';
import 'package:flutter/material.dart';

class MealPlan extends StatelessWidget {
  MealPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 244),
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      appBar: AppBar(
        // App Bar
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Meal Plan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffFFB03E),
              fontSize: 28,
              fontFamily: 'CustomFont',
            ),
          ),
        ),
        backgroundColor: Colors.transparent, // Set to transparent
        elevation: 1.0, // Remove the shadow
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/foot.png",
              alignment: AlignmentDirectional.centerStart,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(70.0), // Add some padding if needed
              child: Opacity(
                opacity:
                    0.3, // Adjust the opacity as needed for watermark effect
                child: SizedBox(
                  height: 90,
                  width: 90,
                  child: Image.asset(
                    'assets/paw.png',
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:
                  const EdgeInsets.all(190.0), // Add some padding if needed
              child: Opacity(
                opacity:
                    0.4, // Adjust the opacity as needed for watermark effect
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset('assets/paw.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(60.0), // Add some padding if needed
              child: Opacity(
                opacity:
                    0.4, // Adjust the opacity as needed for watermark effect
                child: SizedBox(
                  height: 60,
                  width: 70,
                  child: Image.asset('assets/paw.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(55.0), // Add some padding if needed
              child: Opacity(
                opacity:
                    0.4, // Adjust the opacity as needed for watermark effect
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset('assets/paw.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Add some padding if needed
              child: Opacity(
                opacity:
                    0.4, // Adjust the opacity as needed for watermark effect
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: Image.asset('assets/paw.png'),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  const Center(
                    child: Text(
                      "Pet's Name",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Age',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(27))),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          //maxLines: 3,
                          decoration: InputDecoration(
                            labelText: 'Weight',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(27))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 40,
                      width: 178,
                      child: const Center(
                        child: Text(
                          "Check",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xffFFB03E),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "Suggested Meal Plan For Your Pet.",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Color(0xffF9E8BD).withOpacity(0.6),
                    height: 337,
                    width: 371,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                child: const Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StorePage(),
                      ));
                },
                child: const Icon(Icons.shopping_cart)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommunityPage(),
                      ));
                },
                child: const Icon(Icons.people)),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const userProfile(),
                      ));
                },
                child: const Icon(Icons.account_circle)),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
