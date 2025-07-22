import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ingeritypay/backend/auth_service/auth_check_page.dart';

Future<void> main() async {
  // Ensure the environment variables are loaded before starting the app
  try {
    await dotenv.load(fileName: "assets/.env");
  } catch (e) {
    print('Error loading .env file: $e'); // Log the error for debugging
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthCheckPage(),
    );
  }
}
