import 'package:flutter/material.dart';
import 'fitnesspreferences.dart'; // Replace with your next screen

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Neutral black app bar
        elevation: 0, // Optional: Removes shadow effect
      ),
      body: SafeArea( // Ensures that content is inside safe area (not under the status bar)
        child: SingleChildScrollView( // Prevents overflow on smaller screens
          child: Container(
            color: Colors.grey.shade900, // Dark gray background
            padding: EdgeInsets.all(screenWidth * 0.05), // Padding is dynamic based on screen width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.05), // Dynamic spacing

                // Welcome Text
                Text(
                  'Welcome to Physique',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08, // Font size relative to screen width
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White for primary text
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02), // Dynamic spacing
                Text(
                  'Your fitness application and dietary tracker',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Font size relative to screen width
                    color: Colors.grey, // Light gray for secondary text
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05), // Dynamic spacing

                // Logo image
                AspectRatio(
                  aspectRatio: 1, // Maintain aspect ratio (square shape)
                  child: Image.asset(
                    'assets/Physiquelogo.png', // Your logo file path
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Dynamic spacing

                // Get Started Button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FitnessGoalsScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Red button to match the logo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Vertical padding relative to screen height
                    textStyle: TextStyle(
                      fontSize: screenWidth * 0.05, // Font size relative to screen width
                      color: Colors.white, // White text on red button
                    ),
                  ),
                  child: const Text('Get Started'),
                ),
                SizedBox(height: screenHeight * 0.02), // Dynamic spacing

                // Instruction Text
                Text(
                  'By pressing "Get Started", you will begin setting up your fitness and dietary goals.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Font size relative to screen width
                    color: Colors.grey, // Light gray for subtle message
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
