import 'package:flutter/material.dart';
import 'package:physiqueai_apk/Screens/bmi_calculator.dart'; // Import your BMI Calculator screen

class FitnessGoalsScreen extends StatefulWidget {
  const FitnessGoalsScreen({super.key});

  @override
  _FitnessGoalsScreenState createState() => _FitnessGoalsScreenState();
}

class _FitnessGoalsScreenState extends State<FitnessGoalsScreen> {
  List<bool> selectedGoals = List.generate(8, (_) => false);
  String? selectedLevel;
  String? selectedBodyType;

  final List<String> userLevels = ['Beginner', 'Intermediate', 'Advanced'];
  final List<String> bodyTypes = ['Ectomorph', 'Mesomorph', 'Endomorph'];

  void toggleSelection(int index) {
    setState(() {
      selectedGoals[index] = !selectedGoals[index];
    });
  }

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('What’s your fitness goal?'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdowns for User Level and Body Type
            DropdownButtonFormField<String>(
              value: selectedLevel,
              decoration: const InputDecoration(
                labelText: 'Select User Level',
                border: OutlineInputBorder(),
              ),
              items: userLevels
                  .map((level) => DropdownMenuItem(
                        value: level,
                        child: Text(level),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedLevel = value;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedBodyType,
              decoration: const InputDecoration(
                labelText: 'Select Body Type',
                border: OutlineInputBorder(),
              ),
              items: bodyTypes
                  .map((bodyType) => DropdownMenuItem(
                        value: bodyType,
                        child: Text(bodyType),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedBodyType = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Fitness Goals Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => toggleSelection(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedGoals[index]
                            ? Colors.orange.withOpacity(0.7)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            index.isEven
                                ? Icons.fitness_center
                                : Icons.directions_run,
                            size: 40,
                            color: selectedGoals[index]
                                ? Colors.white
                                : Colors.black,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _getGoalLabel(index),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: selectedGoals[index]
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
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
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }

  String _getGoalLabel(int index) {
    switch (index) {
      case 0:
        return 'Lose Weight';
      case 1:
        return 'Build Muscle';
      case 2:
        return 'Get Fit';
      case 3:
        return 'Build Legs';
      case 4:
        return 'Strong Arms';
      case 5:
        return 'Back';
      case 6:
        return 'Muscle Hustle';
      case 7:
        return 'Shred Sprint';
      default:
        return '';
    }
  }
}
