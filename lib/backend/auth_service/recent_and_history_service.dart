import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'auth_service.dart';

class RecentAndHistoryService {
  // final String baseUrl = dotenv.env['API_URL'] ?? 'http://10.0.2.2:3000';
    final String baseUrl = dotenv.env['API_URL'] ?? 'https://integritybackend.onrender.com';


  // Function to get transaction history for a specific account
  Future<List<Map<String, dynamic>>> getTransactionHistory(
      String accountNumber) async {
    final token = await AuthService().getToken(); // Await the token here
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/recent-history/history/$accountNumber'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Use the resolved token
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> transactions = json.decode(response.body)['transactions'];
        return transactions.cast<Map<String, dynamic>>();
      } else if (response.statusCode == 404) {
        throw Exception('No transactions found');
      } else {
        throw Exception('Failed to load transaction history');
      }
    } catch (e) {
      rethrow;
    }
  }

  // In RecentAndHistoryService

// Function to get recent transactions based on the senderUuid (current user)
  Future<List<Map<String, dynamic>>> getRecentTransactions() async {
    final token = await AuthService().getToken(); // Await the token here
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/recent-history/recent-users'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Use the resolved token
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> recentTransactions =
            json.decode(response.body)['recentTransactions'];
        return recentTransactions.cast<Map<String, dynamic>>();
      } else if (response.statusCode == 404) {
        // Instead of throwing an exception, return an empty list
        return [];
      } else {
        throw Exception('Failed to load recent transactions');
      }
    } catch (e) {
      rethrow;
    }
  }
}
