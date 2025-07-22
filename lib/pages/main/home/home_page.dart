// home_page.dart
import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/user_service.dart';
import 'package:ingeritypay/components/home/widgets/carousel/carousel.dart';
import 'package:ingeritypay/components/home/widgets/make_transaction/transacfer.dart';
import 'package:ingeritypay/components/home/widgets/recent_transactions/recent_transactions.dart';
import 'package:ingeritypay/components/home/widgets/profile_balance/stacked_top_banner.dart';
import 'package:ingeritypay/components/home/widgets/services/services.dart';
import 'package:ingeritypay/components/home/widgets/upgrade/upgrade_container.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String accountNumber = '';
  String currentUserName = '';
  final UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
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

  Future<void> _fetchUserData() async {
    try {
      // Fetch the user data and retrieve the user's name
      final userData = await _userService.fetchUserData();
      setState(() {
        currentUserName =
            '${userData?['firstName']} ${userData?['lastName']}'; // Combine firstName and lastName
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const StackedTopBanner(),
            const SizedBox(height: 100),
            const TransferRequestButtons(),
            const SizedBox(height: 30),
            const UpgradeWidget(progressPercentage: 60.0),
            const SizedBox(height: 30),
            const ServicesWidget(),
            const SizedBox(height: 30),
            RecentTransactionWidget(
              accountNumber: accountNumber,
              currentUserName: currentUserName,
            ),
            const SizedBox(height: 30),

            const SizedBox(height: 30),
            const CustomCarousel(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
