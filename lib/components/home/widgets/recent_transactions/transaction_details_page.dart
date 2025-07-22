// transaction_details_page.dart
import 'package:flutter/material.dart';
import 'package:ingeritypay/components/home/model/transaction_model.dart';
import 'package:intl/intl.dart'; // For date formatting

class TransactionDetailsPage extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailsPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    // Format the date for better readability
    String formattedDate = DateFormat.yMMMd().format(transaction.timestamp);

    // Format the amount to include commas and display it as currency
    String formattedAmount = NumberFormat.simpleCurrency().format(transaction.amount);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Sender Information
            Text(
              'Sender: ${transaction.sender}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // Display Receiver Information
            Text(
              'Receiver: ${transaction.receiver}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Display Amount
            Text(
              'Amount: $formattedAmount',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Display Transaction Type (Credit/Debit)
            Text(
              'Transaction Type: ${transaction.transactionType}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Display Transaction Description
            Text(
              'Description: ${transaction.description}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Display Transaction Number
            Text(
              'Transaction Number: ${transaction.transactionNumber}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Display Date (formatted)
            Text(
              'Date: $formattedDate',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
