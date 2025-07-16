// import 'package:bmi_app/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const BMICalculatorApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
//       ),
//       home: SplashScreen(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var wtController = TextEditingController();
//   var ftController = TextEditingController();
//   var inController = TextEditingController();

//   var result = "";
//   var bgColor = Colors.blue.shade50;
//   var msg;

//   @override
//   Widget build(Object context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Check your BMI", style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue.shade500,
//       ),

//       body: Container(
//         color: bgColor,
//         child: Center(
//           child: Container(
//             width: 270,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "BMI",
//                   style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
//                 ),
//                 SizedBox(height: 34),
//                 TextField(
//                   controller: wtController,
//                   decoration: InputDecoration(
//                     label: Text("Enter yout weight(in Kg)"),
//                     prefixIcon: Icon(Icons.line_weight),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 12),
//                 TextField(
//                   controller: ftController,
//                   decoration: InputDecoration(
//                     label: Text("Enter yout height(in Feet)"),
//                     prefixIcon: Icon(Icons.height),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 12),
//                 TextField(
//                   controller: inController,
//                   decoration: InputDecoration(
//                     label: Text("Enter your height(in Inch)"),
//                     prefixIcon: Icon(Icons.height),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 12),
//                 ElevatedButton(
//                   onPressed: () {
//                     var wt = wtController.text.toString();
//                     var ft = ftController.text.toString();
//                     var inch = inController.text.toString();

//                     if (wt != "" && ft != "" && inch != "") {
//                       var intWt = int.parse(wt);
//                       var intFt = int.parse(ft);
//                       var intInch = int.parse(inch);

//                       var totalInch = (intFt * 12) + intInch;
//                       var totalCm = totalInch * 2.54;
//                       var totalM = totalCm / 100;

//                       var bmi = intWt / (totalM * totalM);
//                       msg = "";

//                       if (bmi > 25) {
//                         msg = "You're OverWeight!!";
//                         bgColor = Colors.orange.shade200;
//                       } else if (bmi < 18) {
//                         msg = "You're UnderWeight!!";
//                         bgColor = Colors.red.shade200;
//                       } else {
//                         msg = "You're Healthy";
//                         bgColor = Colors.green.shade200;
//                       }

//                       setState(() {
//                         result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
//                       });
//                     } else {
//                       setState(() {
//                         result = "Please fill all the required blanks";
//                       });
//                     }
//                   },
//                   child: Text("Calculate"),
//                 ),

//                 SizedBox(height: 12),

//                 Text(result, style: TextStyle(fontSize: 19)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: BMIScreen(),
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
        backgroundColor: const Color.fromARGB(255, 68, 6, 79),
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),

      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 125, 22, 137),
              Color.fromARGB(255, 208, 103, 222),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Enter your details:",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.white,
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
                backgroundColor: const Color.fromARGB(255, 209, 34, 240),
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
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 35),

            if (bmi != null) _buildResultCard(),

            Text("This iS BMI Calculator"),
          ],
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
        duration: const Duration(
          milliseconds: 300,
        ), // changed to milliseconds for smoother animation
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white
              : const Color.fromARGB(223, 227, 227, 227),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // shadow color
              spreadRadius: 2, // how much the shadow spreads
              blurRadius: 5, // blur effect
              offset: const Offset(0, 3), // position of the shadow (x, y)
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.deepPurple : Colors.black),
            const SizedBox(width: 10),

            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.deepPurple : Colors.black,
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
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: Icon(icon, color: Colors.black),
        filled: true,
        fillColor: const Color.fromARGB(186, 251, 191, 251),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Card(
      color: const Color.fromARGB(189, 255, 255, 255),
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
                color: Colors.deepPurple,
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
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
