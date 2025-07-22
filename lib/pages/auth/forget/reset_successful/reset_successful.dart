// import 'package:flutter/material.dart';
// import 'package:ingeritypay/pages/auth/login/login.dart';
// import 'package:lottie/lottie.dart';

// class ResetSuccessScreen extends StatelessWidget {
//   const ResetSuccessScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Lottie animation at the top
//               Lottie.asset(
//                 'assets/lotties/complete.json', // Add your Lottie file in assets
//                 width: 150,
//                 height: 150,
//               ),
//               const SizedBox(height: 30),

//               // Header text
//               const Text(
//                 "Password Updated",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 15),

//               // Descriptive text
//               const Text(
//                 " Your password has been successfully reset. You can now log in with your new password.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16, color: Colors.black54),
//               ),
//               const Spacer(),

//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LoginScreen(),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     backgroundColor: const Color(0xFF1F4799),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     'Back to Login',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
