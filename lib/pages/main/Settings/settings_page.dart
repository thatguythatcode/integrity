import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/auth_service.dart';
import 'package:ingeritypay/pages/onboarding/onboarding_screen.dart';

class Setting extends StatelessWidget {
  final AuthService authService = AuthService();

  Setting({super.key});

  void navigateTo(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to $title')),
    );
  }

  Future<void> handleSignOut(BuildContext context) async {
    try {
      await authService.logout();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signed out successfully')),
      );
      // Navigate to onboarding screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()), // Replace with your onboarding screen
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingsOptions = [
      {'title': 'Security Center', 'icon': Icons.security},
      {'title': 'Profile', 'icon': Icons.person},
      {'title': 'Account Limit', 'icon': Icons.account_balance_wallet},
      {'title': 'Terms and Conditions', 'icon': Icons.description},
      {'title': 'Customer Service Center', 'icon': Icons.support_agent},
      {'title': 'Rate Us', 'icon': Icons.star_rate},
      {'title': 'Payment Settings', 'icon': Icons.payment},
      {'title': 'Login Settings', 'icon': Icons.login},
      {'title': 'Close Account', 'icon': Icons.cancel},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: settingsOptions.length,
              itemBuilder: (context, index) {
                final option = settingsOptions[index];
                return ListTile(
                  leading: Icon(option['icon']),
                  title: Text(option['title']),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => navigateTo(context, option['title']),
                );
              },
            ),
          ),
          const Spacer(), // Pushes the logout button to the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => handleSignOut(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text("Sign Out"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
