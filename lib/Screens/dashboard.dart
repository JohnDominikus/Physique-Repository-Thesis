import 'package:flutter/material.dart';
import 'package:physiqueai_apk/Screens/bmi_calculator.dart'; // Import your BMI Calculator screen

class FitnessDashboardScreen extends StatefulWidget {
  const FitnessDashboardScreen({super.key});

  @override      
  _FitnessDashboardScreenState createState() => _FitnessDashboardScreenState();
}

class _FitnessDashboardScreenState extends State<FitnessDashboardScreen> {
  void navigateToBMICalculator() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BMICalculator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.spa), // Posture AI Icon
          onPressed: () {},
        ),
        title: const Text('Posture AI'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center - Posture Circle
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.withOpacity(0.2),
                  border: Border.all(
                    color: Colors.orange,
                    width: 4,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.accessibility_new, // Posture Icon
                    size: 50,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // NEXT Button (Optional for Navigation)
            ElevatedButton(
              onPressed: navigateToBMICalculator,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'NEXT',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank), // Food Tracker Icon
            label: 'Food Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run), // Exercise Tracker Icon
            label: 'Exercise Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam), // Exercise Video Icon
            label: 'Exercise Videos',
          ),
        ],
      ),
    );
  }
}
