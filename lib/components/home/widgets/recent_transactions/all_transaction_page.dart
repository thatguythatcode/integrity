import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/recent_and_history_service.dart';
import 'package:ingeritypay/components/home/model/transaction_model.dart';
import 'package:ingeritypay/components/home/widgets/recent_transactions/transaction_list.dart';
import 'transaction_details_page.dart';

class AllTransactionsPage extends StatefulWidget {
  final String accountNumber;
  final String currentUserName;

  const AllTransactionsPage({
    super.key,
    required this.accountNumber,
    required this.currentUserName,
  });

  @override
  State<AllTransactionsPage> createState() => _AllTransactionsPageState();
}

class _AllTransactionsPageState extends State<AllTransactionsPage> {
  final RecentAndHistoryService recentAndHistoryService =
      RecentAndHistoryService();
  String searchQuery = '';
  DateTime? selectedDate;

  Future<List<Transaction>> fetchTransactions() async {
    try {
      List<Map<String, dynamic>> transactionsData =
          await recentAndHistoryService
              .getTransactionHistory(widget.accountNumber);
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
      if (transaction.sender != widget.currentUserName) {
        userDescription = 'Credit by ${transaction.sender}';
      }
    } else {
      if (transaction.receiver != widget.currentUserName) {
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

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: selectedDate ?? DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              selectedDate = newDate;
            });
          },
          minimumYear: 2000,
          maximumYear: DateTime.now().year,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Transactions'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search by name...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Transaction>>(
              future: fetchTransactions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error: ${snapshot.error}",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No transactions found"));
                } else {
                  final transactions = snapshot.data!.where((transaction) {
                    final dateMatches = selectedDate == null ||
                        (selectedDate!.month == transaction.timestamp.month &&
                            selectedDate!.year == transaction.timestamp.year);

                    final nameMatches = transaction.sender
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()) ||
                        transaction.receiver
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase());

                    return dateMatches && nameMatches;
                  }).toList();

                  if (transactions.isEmpty) {
                    return const Center(
                      child: Text(
                        "No transactions match your search or filter criteria.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        return _buildTransactionItem(
                            context, transactions[index]);
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
