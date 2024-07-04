import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The",
                style: TextStyle(
                    fontFamily: 'InknutAn',
                    fontWeight: FontWeight.w900,
                    color: Color(0XFF274C77),
                    fontSize: 25)),
            SizedBox(
              width: 6,
            ),
            Text(
              "Daily",
              style: TextStyle(
                  fontFamily: 'InknutAn',
                  fontWeight: FontWeight.w900,
                  color: Color(0XFF6096BA),
                  fontSize: 25),
            ),
            SizedBox(
              width: 6,
            ),
            Text("Scoop",
                style: TextStyle(
                    fontFamily: 'InknutAn',
                    fontWeight: FontWeight.w900,
                    color: Color(0XFF274C77),
                    fontSize: 25))
          ],
        ),
      ),
    );
  }
}



// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Set your background color here
//       body: Center(
//         child: Image.asset(
//           'assets/images/logo.png', // Replace with your own image asset
//           width: 200.0, // Adjust the size as needed
//         ),
//       ),
//     );
//   }
// }
