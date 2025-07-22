// import 'package:flutter/material.dart';
// import 'package:ingeritypay/pages/auth/forget/forget_password_otp/forget_sms_retriver.dart';
// import 'package:ingeritypay/pages/auth/forget/reset_password/reset_password.dart';
// import 'package:pinput/pinput.dart';
// import 'package:smart_auth/smart_auth.dart';

// class ForgetOTPScreen extends StatefulWidget {
//   const ForgetOTPScreen({super.key});

//   @override
//   State<ForgetOTPScreen> createState() => _ForgetOTPScreenState();
// }

// class _ForgetOTPScreenState extends State<ForgetOTPScreen> {
//   late final SmsRetriever smsRetriever;
//   late final TextEditingController pinController;
//   late final FocusNode focusNode;
//   late final GlobalKey<FormState> formKey;

//   @override
//   void initState() {
//     super.initState();
//     formKey = GlobalKey<FormState>();
//     pinController = TextEditingController();
//     focusNode = FocusNode();

//     /// In case you need an SMS autofill feature
//     smsRetriever = SmsRetrieverImpl(
//       SmartAuth(),
//     );
//   }

//   @override
//   void dispose() {
//     pinController.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
//     const fillColor = Color.fromRGBO(243, 246, 249, 0);
//     const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         color: Color.fromRGBO(30, 60, 87, 1),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(19),
//         border: Border.all(color: borderColor),
//       ),
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: Image.asset(
//                   "assets/images/icons/otp.png",
//                   width: 80,
//                   height: 80,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Phone Number Verification",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "We’ve sent a code to your phone number. Enter the code below to reset your password. If you don’t see the message, check your SMS settings or request a new code.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16, color: Colors.black54),
//               ),
//               const SizedBox(height: 30),
//               Form(
//                 key: formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Directionality(
//                       textDirection: TextDirection.ltr,
//                       child: Pinput(
//                         smsRetriever: smsRetriever,
//                         controller: pinController,
//                         focusNode: focusNode,
//                         defaultPinTheme: defaultPinTheme,
//                         separatorBuilder: (index) => const SizedBox(width: 8),
//                         length: 6,
//                         validator: (value) {
//                           if (value == null || value.length < 6) {
//                             return 'Enter a valid 6-digit PIN';
//                           } else if (value == '123456') {
//                             // Navigate to the next page if PIN is correct
//                             WidgetsBinding.instance.addPostFrameCallback((_) {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const PasswordResetScreen()),
//                               );
//                             });
//                             return null; // Return null to indicate valid input
//                           }
//                           return 'Incorrect PIN. Please try again.'; // Return error if PIN is incorrect
//                         },
//                         hapticFeedbackType: HapticFeedbackType.lightImpact,
//                         onCompleted: (pin) {
//                           debugPrint('onCompleted: $pin');
//                         },
//                         onChanged: (value) {
//                           debugPrint('onChanged: $value');
//                         },
//                         cursor: Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.only(bottom: 9),
//                               width: 22,
//                               height: 1,
//                               color: focusedBorderColor,
//                             ),
//                           ],
//                         ),
//                         focusedPinTheme: defaultPinTheme.copyWith(
//                           decoration: defaultPinTheme.decoration!.copyWith(),
//                         ),
//                         submittedPinTheme: defaultPinTheme.copyWith(
//                           decoration: defaultPinTheme.decoration!.copyWith(
//                             color: fillColor,
//                             borderRadius: BorderRadius.circular(19),
//                             border: Border.all(color: focusedBorderColor),
//                           ),
//                         ),
//                         errorPinTheme: defaultPinTheme.copyBorderWith(
//                           border: Border.all(color: Colors.redAccent),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     const Text(
//                       "Didn’t receive OTP?",
//                       style: TextStyle(fontSize: 16, color: Colors.black54),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "Resend code in 59 sec",
//                       style: TextStyle(fontSize: 16, color: Colors.blue),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
