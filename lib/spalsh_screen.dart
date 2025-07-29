import 'dart:async';
import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BMIScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal[100]!, // Lighter teal
              Colors.teal[300]!, // Light teal
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ), // Kept darker teal for splash screen contrast
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI App",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white, // White for contrast
                ),
              ),
              SizedBox(height: 20),
              Icon(
                Icons.fitness_center,
                size: 80,
                color: Colors.white, // White for contrast
              ),
            ],
          ),
        ),
      ),
    );
  }
}
