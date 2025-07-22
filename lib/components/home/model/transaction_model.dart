import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date and currency formatting

class Transaction {
  final String sender;
  final String receiver;
  final double amount;
  final String transactionType;
  final String description;
  final String transactionNumber;
  final DateTime timestamp;
  final IconData icon;
  final Color color;
  final bool isSend;
  final String formattedAmount;
  final String formattedDate;
  final String userDescription;  // This remains in the model

  Transaction({
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.transactionType,
    required this.description,
    required this.transactionNumber,
    required this.timestamp,
    required this.icon,
    required this.color,
    required this.isSend,
    required this.formattedAmount,
    required this.formattedDate,
    required this.userDescription,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    // Format the transaction date and amount during object creation
    String formattedDate = DateFormat.yMMMd().format(DateTime.parse(json['timestamp']));
    String formattedAmount = NumberFormat.simpleCurrency(name: 'NGN').format(json['amount']?.toDouble() ?? 0.0);
    
    return Transaction(
      sender: json['sender'],
      receiver: json['receiver'],
      amount: json['amount']?.toDouble() ?? 0.0,
      transactionType: json['transactionType'],
      description: json['description'],
      transactionNumber: json['transactionNumber'],
      timestamp: DateTime.parse(json['timestamp']),
      icon: json['transactionType'] == 'credit' ? Icons.arrow_downward : Icons.arrow_upward,
      color: json['transactionType'] == 'credit' ? Colors.green : Colors.red,
      isSend: json['transactionType'] == 'debit',
      formattedAmount: formattedAmount,
      formattedDate: formattedDate,
      userDescription: '',  // Default empty, will be set in the widget
    );
  }

  // Add copyWith method to support changes
  Transaction copyWith({
    String? sender,
    String? receiver,
    double? amount,
    String? transactionType,
    String? description,
    String? transactionNumber,
    DateTime? timestamp,
    IconData? icon,
    Color? color,
    bool? isSend,
    String? formattedAmount,
    String? formattedDate,
    String? userDescription
  }) {
    return Transaction(
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      amount: amount ?? this.amount,
      transactionType: transactionType ?? this.transactionType,
      description: description ?? this.description,
      transactionNumber: transactionNumber ?? this.transactionNumber,
      timestamp: timestamp ?? this.timestamp,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      isSend: isSend ?? this.isSend,
      formattedAmount: formattedAmount ?? this.formattedAmount,
      formattedDate: formattedDate ?? this.formattedDate,
      userDescription: userDescription ?? this.userDescription
    );
  }
}
