// import 'dart:async';

// import 'package:bmi_app/main.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();

//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MyHomePage()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.lightBlue,
//         child: Center(
//           child: Text(
//           "BMI App",
//           style: TextStyle(
//             fontSize: 34,
//             fontWeight: FontWeight.w700,
//             color: Colors.white,
//           ),
//         ),
//         )
//       ),
//     );
//   }
// }
