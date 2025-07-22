// onboarding_content.dart

import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const OnboardingContent({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 358,
      height: 381,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const ShapeDecoration(
              color: Color(0xFF1F4799),
              shape: OvalBorder(),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 42,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 34,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: Color(0xFF0A0A0A),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 291,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                color: Color(0xFF0A0A0A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
