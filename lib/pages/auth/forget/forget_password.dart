// import 'package:flutter/material.dart';
// import 'package:ingeritypay/pages/auth/forget/forget_password_otp/forget_otp.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset:
//           false, // Prevents resize when the keyboard is open
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Fixed background image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/images/signup/signupbg.png"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Scrollable content overlay
//           SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 80), // Spacing for top logo alignment
//                 // Logo at the top
//                 Image.asset(
//                   "assets/images/logo/logo2.png",
//                   width: 80,
//                   height: 80,
//                 ),
//                 const SizedBox(height: 20),
//                 // Header text
//                 const Text(
//                   'Forgot your password?',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 // Instruction text
//                 const Text(
//                   "No worries, it happens. Enter your phone number, and we’ll send you instructions to reset your password.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Color(0xFF6B6B6B),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 // Phone number label and input field
//                 const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Phone Number',
//                     style: TextStyle(
//                       color: Color(0xFF0A0A0A),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   keyboardType: TextInputType.phone,
//                   style: const TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: Colors.black,
//                       ),
//                     ),
//                     hintText: "Enter your phone number",
//                     hintStyle: const TextStyle(
//                       color: Color(0xFFD1D1D1),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Send Instructions button
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ForgetOTPScreen()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: const Color(0xFFE9EDF5),
//                     backgroundColor: const Color(0xFF1F4799), // Text color
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     fixedSize: const Size(400, 48),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     textStyle: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   child: const Text(
//                     'Continue',
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 20), // Space before footer
//               ],
//             ),
//           ),
//           // Footer with navigation to Sign Up
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Remembered your password? ',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate back to the Login page or the relevant screen
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       'Log In',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
