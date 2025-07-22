import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'auth_service.dart';
import 'user_service.dart';

class TransactionService {
  // final String baseUrl = dotenv.env['API_URL'] ?? 'http://10.0.2.2:3000';
    final String baseUrl = dotenv.env['API_URL'] ?? 'https://integritybackend.onrender.com';


  final UserService _userService = UserService();

  // Function to get user by account number
  Future<Map<String, dynamic>> getUserByAccountNumber(
      String accountNumber) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/transactions/accountNumber/$accountNumber'),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body); // Return the user data as a map
      } else if (response.statusCode == 404) {
        throw Exception('Account not found');
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Function to send money to a user's account
  Future<Map<String, dynamic>> sendMoneyToAccount(
    String accountNumber,
    double amount, {
    required String
        senderAccountNumber, // Accept senderAccountNumber as a named parameter
  }) async {
    try {
      // Fetch sender's details (you could also verify sender's account balance here)
      final senderDetails = await _userService.fetchUserData();
      final token = await AuthService().getToken(); // Await the token here
      if (senderDetails == null) {
        throw Exception('Failed to fetch sender details');
      }

      final response = await http.post(
        Uri.parse('$baseUrl/transactions/sendMoney'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Use the resolved token
        },
        body: json.encode({
          'accountNumber': accountNumber,
          'amount': amount,
          'senderAccountNumber':
              senderAccountNumber, // Add senderAccountNumber to the request
          'sender': senderDetails, // Include sender details in the request body
        }),
      );

      if (response.statusCode == 200) {
        return json
            .decode(response.body); // Return the response with the new balance
      } else {
        throw Exception('Failed to send money');
      }
    } catch (e) {
      rethrow;
    }
  }
}
