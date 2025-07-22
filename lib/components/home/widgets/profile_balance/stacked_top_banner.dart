// stacked_top_banner.dart
import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/user_service.dart';
import 'top_section.dart';
import 'balance.dart';
import 'topbanner.dart';

class StackedTopBanner extends StatefulWidget {
  const StackedTopBanner({super.key});

  @override
  State<StackedTopBanner> createState() => _StackedTopBannerState();
}

class _StackedTopBannerState extends State<StackedTopBanner> {
  String accountNumber = '';
  String currentUserName = '';
  final UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    _fetchAccountNumber();
  }

  Future<void> _fetchAccountNumber() async {
    try {
      // Fetch the user data and retrieve the account number
      final userData = await _userService.fetchUserData();
      setState(() {
        accountNumber =
            userData?['accountNumber'] ?? ''; // Update with the account number
      });
    } catch (e) {
      print('Error fetching account number: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox( // Wrap Stack with a Container to set height
      height: 250,  // Set the height based on your layout needs
      child: Stack(
        clipBehavior: Clip.none,  // Allow child widgets to overflow
        alignment: Alignment.center,
        children: [
          const TopBanner(),
          const Positioned(
            top: 60,
            child: TopSection(),
          ),
          Positioned(
            top: 140, // Adjust top as needed for positioning
            left: 16,
            right: 16,
            child: Material(  // Added Material widget for better interaction
              color: Colors.transparent,  // Keep transparent to avoid color interference
              child: BalanceWidget(
                accountNumber: accountNumber,
                currentUserName: currentUserName,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
