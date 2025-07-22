import 'package:flutter/material.dart';

import 'widgets/recent_transfer/recent_transactions_page.dart';
import 'widgets/transfer.dart';

class TransferMoneyPage extends StatelessWidget {
  const TransferMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              TransferWidget(),
              SizedBox(height: 20),
              RecentTransactionsPage(),
            ],
          ),
        ),
      ),
    );
  }
}