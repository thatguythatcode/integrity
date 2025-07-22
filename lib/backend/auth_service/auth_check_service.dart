import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/auth_service.dart';
import 'package:ingeritypay/components/nav_bar/main_nav_page.dart';
import 'package:ingeritypay/pages/onboarding/onboarding_screen.dart';

class AuthCheckService {
  // Function to check if the user is authenticated
  Future<String?> checkAuthentication() async {
    final token = await AuthService().getToken(); // Await the token here
    print("Token: $token");
    return token; // Return the token if it exists, null otherwise
  }

  // Function to navigate based on authentication status
  Future<void> navigateBasedOnAuth(BuildContext context) async {
    final token = await checkAuthentication(); // Await the token here

    if (token != null) {
      // User is authenticated, navigate to Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavMainPage()),
      );
    } else {
      // User is not authenticated, navigate to Onboarding screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }
}
