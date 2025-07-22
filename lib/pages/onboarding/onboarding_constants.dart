// constants.dart

import 'package:flutter/material.dart';
import 'onboarding_content.dart';

final List<Widget> onboardingScreens = [
  const OnboardingContent(
    icon: Icons.account_balance_wallet, // Example icon
    title: 'Welcome \nto \nIntegrity pay',
    description: 'Track your spending effortlessly with automatic categorization — all in one place with Integrity Pay!',
  ),
  const OnboardingContent(
    icon: Icons.insights, // Example icon
    title: 'Effortless Financial Tracking, All in One Place',
    description: 'Your Finances, Simplified. Automatically track and categorize your spending in one place.',
  ),
  const OnboardingContent(
    icon: Icons.qr_code_scanner, // Example icon
    title: 'Easy Payments with QR Code',
    description: 'Make payments instantly with a simple scan. Experience the future of hassle-free transactions.',
  ),
];
