import 'package:chat/pages/community.dart';
import 'package:chat/pages/home_page.dart';
import 'package:chat/pages/loging_page.dart';
import 'package:chat/pages/petregistration_page.dart';
import 'package:chat/pages/store_page.dart';
import 'package:chat/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

// ignore: non_constant_identifier_names
final typeOfPetController = TextEditingController();

class _userProfileState extends State<userProfile> {

   int _currentIndex = 3;
  Future<String?> userProfile() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/user-profile');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['userName'];
      } else {
        return 'Failed to fetch user profile. Status code: ${response.statusCode}';
      }
    } catch (e) {
      return 'An error occurred. Please try again.';
    }
  }

  void selectPetCategory(String typeOfPet) async {
    // Ensure both fields are filled
    if (typeOfPet.isEmpty) {
      showErrorDialog('Please enter type of pet.');
      return;
    }
    try {
      var url = Uri.parse('http://10.0.2.2:8000/user-profile');
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: {"type_of_pet": typeOfPet});
    } catch (e) {
      showErrorDialog('An error occurred. Please try again.');
    }
  }

  //error showing method
  void showErrorDialog(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

    void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StorePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommunityPage()),
        );
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 246, 244),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // App Bar
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Profile",
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
                padding:
                    const EdgeInsets.all(70.0), // Add some padding if needed
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
                padding:
                    const EdgeInsets.all(60.0), // Add some padding if needed
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
                padding:
                    const EdgeInsets.all(55.0), // Add some padding if needed
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
                padding:
                    const EdgeInsets.all(10.0), // Add some padding if needed
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
            ), // Background Image (if needed)

            // Foreground Content
            SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  _userDetail(),
                  _petCategory(),
                  _petAdding(),
                ],
              ),
            ),
          ],
        ),
         bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onNavBarTap,
        ),
      ),
    );
  }

  _userDetail() {
    return FutureBuilder<String?>(
      future: userProfile(), // Call the asynchronous function
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            children: [
              SizedBox(
                height: 120,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Loading...",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 55),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.transparent,
                ),
              ),
            ],
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          // Handle errors and null data
          return Row(
            children: [
              SizedBox(
                height: 80,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Error",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 55),
              Container(
                color: Color(0xffF9E8BD),
              ),
            ],
          );
        } else {
          return Row(
            children: [
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    snapshot.data ?? "User",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 55),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.transparent),
              ),
            ],
          );
        }
      },
    );
  }

  _petCategory() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Select your pet category",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffF9E8BD),
            ),
            width: 70,
            height: 80,
            child: IconButton(
              onPressed: () {
                selectPetCategory("dog");
              },
              icon: const Image(image: AssetImage("assets/doglogo.png")),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffF9E8BD),
            ),
            width: 70,
            height: 80,
            child: IconButton(
              onPressed: () {
                selectPetCategory("cat");
              },
              icon: const Image(
                image: AssetImage("assets/catlogo.png"),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffF9E8BD),
            ),
            width: 70,
            height: 80,
            child: IconButton(
              onPressed: () {
                selectPetCategory("fish");
              },
              icon: const Image(
                image: AssetImage("assets/fishlogo.png"),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffF9E8BD),
            ),
            width: 70,
            height: 80,
            child: IconButton(
              onPressed: () {
                selectPetCategory("rabbit");
              },
              icon: const Image(
                image: AssetImage("assets/rabbitlogo.png"),
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _petAdding() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 249, 230, 160),
            image: const DecorationImage(
                image: AssetImage("assets/addaone.jpg"),
                fit: BoxFit.cover,
                opacity: 0.7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetRegistrationPage(),
                      ));
                },
                child: const Icon(Icons.add_circle_outline,
                    size: 40, color: Colors.black),
              ), // Add your icon
              SizedBox(height: 10), // Spacing between icon and text
              const Text(
                "Add Your Pet",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black, // Text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 249, 230, 160),
            image: const DecorationImage(
              image: AssetImage("assets/addtwo.jpg"),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle_outline,
                  size: 40, color: Colors.black), // Add your icon
              SizedBox(height: 10), // Spacing between icon and text
              Text(
                "Add Your Pet",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black, // Text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
