import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/recent_and_history_service.dart';
import 'package:ingeritypay/components/home/model/transaction_model.dart';
import 'package:ingeritypay/components/home/widgets/recent_transactions/transaction_list.dart';

import 'all_transaction_page.dart';
import 'transaction_details_page.dart';

class RecentTransactionWidget extends StatelessWidget {
  final String accountNumber;
  final String currentUserName;
  final RecentAndHistoryService recentAndHistoryService = RecentAndHistoryService();

  RecentTransactionWidget(
      {super.key, required this.accountNumber, required this.currentUserName});

  Future<List<Transaction>> fetchTransactions() async {
    try {
      List<Map<String, dynamic>> transactionsData =
          await recentAndHistoryService.getTransactionHistory(accountNumber);
      return transactionsData
          .map((data) => Transaction.fromJson(data))
          .toList();
    } catch (e) {
      throw Exception("Failed to load transactions: $e");
    }
  }

  Widget _buildTransactionItem(BuildContext context, Transaction transaction) {
    String userDescription = '';
    if (transaction.transactionType == 'credit') {
      if (transaction.sender != currentUserName) {
        userDescription = 'Credit by ${transaction.sender}';
      }
    } else {
      if (transaction.receiver != currentUserName) {
        userDescription = 'Send to ${transaction.receiver}';
      }
    }

    if (userDescription.isEmpty) {
      return const SizedBox.shrink();
    }

    return TransactionListItem(
      transaction: transaction.copyWith(
        userDescription: userDescription,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TransactionDetailsPage(transaction: transaction),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: fetchTransactions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No transactions found"));
        } else {
          final transactions = snapshot.data!;
          final topTransactions = transactions.take(10).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Transactions',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to AllTransactionsPage when 'See all...' is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllTransactionsPage(
                              accountNumber: accountNumber,
                              currentUserName: currentUserName,
                            ),
                          ),
                        );
                      },
                      child: const Text('See all...',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (topTransactions.isNotEmpty)
                for (var transaction in topTransactions)
                  _buildTransactionItem(context, transaction),
            ],
          );
        }
      },
    );
  }
}
