import 'package:flutter/material.dart';

// Import the second page
import 'quiz_page.dart';  // Make sure to import the quiz page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(), // First page with the play button
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Logo centered at the top of the screen
          Align(
            alignment: Alignment.topCenter,  // Align the logo at the top center
            child: Padding(
              padding: const EdgeInsets.only(top: 100),  // Adds space at the top
              child: Image.asset(
                'assets/images/logo.png', // Path to your logo image
                width: 200, // Width of the logo
                height: 200, // Height of the logo
              ),
            ),
          ),
          // Play Button positioned at the bottom
          Align(
            alignment: Alignment.bottomCenter,  // Align the button at the bottom center
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),  // Adds space at the bottom
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next page when the "Play" button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()), // Navigate to QuizPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.withOpacity(0.7),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
