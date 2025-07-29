import 'package:bmi_app/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Changed from deepPurple to teal
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          accentColor: Colors.teal[300], // Light teal for accents
          backgroundColor: Colors.white, // White background
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.teal[900]), // Dark teal for text
          bodyMedium: TextStyle(color: Colors.teal[900]),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal[300], // Light teal for buttons
            foregroundColor: Colors.white, // White text/icons on buttons
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double? bmi;
  String? category;
  String? gender;

  void calculateBMI() {
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);

    setState(() {
      bmi = weight / pow(height, 2);

      if (bmi! < 18.5) {
        category = 'Underweight';
      } else if (bmi! >= 18.5 && bmi! < 24.9) {
        category = 'Normal';
      } else if (bmi! >= 25 && bmi! <= 29.9) {
        category = 'Overweight';
      } else {
        category = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200], // Changed to light teal
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black, // White for contrast
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).padding.top + kToolbarHeight),
          ),
          child: IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: const Color.fromARGB(255, 211, 243, 241),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Enter your details:",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black, // White for contrast
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  _buildGenderToggle(),
                  const SizedBox(height: 35),
                  _buildInputFields(
                    controller: heightController,
                    label: "Height (cm)",
                    icon: Icons.height,
                  ),
                  const SizedBox(height: 25),
                  _buildInputFields(
                    controller: weightController,
                    label: "Weight (kg)",
                    icon: Icons.line_weight,
                  ),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: calculateBMI,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.teal[300], // Light teal
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                    ),
                    child: Text(
                      "Calculate BMI",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White for contrast
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  if (bmi != null) _buildResultCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildGenderButton("Male", Icons.male, gender == "Male"),
        const SizedBox(width: 20),
        _buildGenderButton("Female", Icons.female, gender == "Female"),
      ],
    );
  }

  Widget _buildGenderButton(String label, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          gender = label;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color.fromARGB(211, 222, 222, 222), // White when selected, light teal otherwise
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.3), // Teal shadow
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.teal[700] : Colors.black // Darker teal for icons
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.teal[700] : Colors.black, // Darker teal for text
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.black), // Teal text
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black), // Teal label
        prefixIcon: Icon(icon, color: Colors.black), // Darker teal icon
        filled: true,
        fillColor: Colors.white, // White background for input fields
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal), // Teal border
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal), // Teal border
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Card(
      color: Colors.white, // White card background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your BMI is: ${bmi?.toStringAsFixed(2) ?? '--'}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700], // Darker teal for text
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Category: $category",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: bmi! < 18.5
                    ? Colors.orange
                    : (bmi! < 24.9
                        ? Colors.green
                        : (bmi! < 29.9 ? Colors.deepOrange : Colors.red)),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Gender: $gender",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700], // Darker teal for text
              ),
            ),
          ],
        ),
      ),
    );
  }
}