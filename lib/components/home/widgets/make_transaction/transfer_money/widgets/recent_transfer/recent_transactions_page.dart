import 'package:flutter/material.dart';
import 'pages/beneficiary_page.dart';
import 'pages/my_contacts_page.dart';
import 'pages/recent_page.dart';
import 'top_tabs.dart';
import 'search_field.dart';

class RecentTransactionsPage extends StatefulWidget {
  const RecentTransactionsPage({super.key});

  @override
  State<RecentTransactionsPage> createState() => _RecentTransactionsPageState();
}

class _RecentTransactionsPageState extends State<RecentTransactionsPage> {
  String activeTab = 'Recents';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 390,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopTabs(
            activeTab: activeTab,
            onTabSelected: (String tab) {
              setState(() {
                activeTab = tab;
              });
            },
          ),
          const SizedBox(height: 24),
          const SearchField(),
          const SizedBox(height: 24),
          
          // Conditional rendering based on activeTab value
          if (activeTab == 'Recents') const RecentPage(),        // Show the RecentPage
          if (activeTab == 'Beneficiary') const BeneficiaryPage(), // Show the BeneficiaryPage
          if (activeTab == 'My Contacts') const MyContactsPage(),  // Show the MyContactsPage
        ],
      ),
    );
  }
}
