import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ingeritypay/backend/auth_service/recent_and_history_service.dart';
import 'widgets/recent_page_styles.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  late Future<List<Map<String, dynamic>>> recentTransactions;

  @override
  void initState() {
    super.initState();
    // Initialize the fetchRecentTransactionsForCurrentUser function
    recentTransactions = RecentAndHistoryService().getRecentTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>( 
      future: recentTransactions,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          ); // Show loading spinner
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Display the empty state widget
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icons/empty.png",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 16),
                const Text(
                  'You have no recent transactions',
                  style: TextStyle(
                    color: Color(0xFFBAC6DF),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        } else {
          // If data is available, display the list of recent transactions
          final transactions = snapshot.data!;
          return Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: RecentPageStyles.avatarBackgroundColor,
                        child: Text(
                          '${transaction['firstName'][0]}${transaction['lastName'][0]}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        '${transaction['firstName']} ${transaction['lastName']}',
                        style: RecentPageStyles.nameTextStyle,
                      ),
                      subtitle: Text(
                        '${transaction['accountNumber']}',
                        style: RecentPageStyles.accountNumberTextStyle,
                      ),
                    ),
                    RecentPageStyles.dividerStyle,
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
