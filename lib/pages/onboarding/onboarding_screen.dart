import 'package:flutter/material.dart';
import 'package:ingeritypay/pages/auth/email/email.dart';
import 'package:ingeritypay/pages/auth/login/login.dart';
import 'package:ingeritypay/pages/onboarding/onboarding_constants.dart';

// Custom clipper for the half circle cutout
class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width / 2, 70, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  // Method to handle page changes
  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // Method to skip to the last screen
  void goToLastScreen() {
    setState(() {
      currentIndex = onboardingScreens.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          _buildTopNavigation(),
          // Wrap the PageView widget here to enable swipe functionality
          Expanded(
            child: PageView.builder(
              itemCount: onboardingScreens.length,
              onPageChanged: onPageChanged, // Update index on page change
              itemBuilder: (context, index) {
                return onboardingScreens[index];
              },
            ),
          ),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildTopNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 34.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment
            .center, // Align children vertically in the center
        children: [
          _buildIndicator(),
          if (currentIndex < onboardingScreens.length - 1)
            GestureDetector(
              onTap: goToLastScreen,
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingScreens.length, // Total number of onboarding screens
          (index) {
            // Set the width of the indicator segment
            double width = (index <= currentIndex)
                ? 24 // Width for active indicators
                : 8; // Width for inactive indicators

            return InkWell(
              onTap: () => setState(
                  () => currentIndex = index), // Handle tap to change index
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                height: 8, // Height of the indicator
                width: width, // Set width based on index
                decoration: BoxDecoration(
                  color: (index <=
                          currentIndex) // Change color based on active/inactive
                      ? Colors.blue
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(4), // Rounded edges
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return ClipPath(
      clipper: HalfCircleClipper(),
      child: Container(
        width: double.infinity,
        height: 240,
        color: const Color(0xFF1F4799),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 60.0),
          child: Column(
            children: [
              _buildLoginButton(),
              const SizedBox(height: 16),
              _buildCreateAccountButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
         Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  const LoginPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text('Login', style: TextStyle(color: 
        Colors.black)),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  const EmailScreen()),
          );
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.white),
          ),
        ),
        child: const Text('Create Account', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
