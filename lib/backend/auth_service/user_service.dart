import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'auth_service.dart'; 



class UserService {
  final String baseUrl = dotenv.env['API_URL'] ?? 'http://10.0.2.2:3000';
  // final String baseUrl = dotenv.env['API_URL'] ?? 'https://integritybackend.onrender.com';

  Future<Map<String, dynamic>?> fetchUserData() async {
    final token = await AuthService().getToken(); // Await the token here

    final response = await http.get(
      Uri.parse('$baseUrl/user/data'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Use the resolved token
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Return the user data
    } else {
      return null; // Return null if the request fails
    }
  }

  Future<double?> fetchUserAccountBalance() async {
    final token = await AuthService().getToken(); // Await the token here

    final response = await http.get(
      Uri.parse('$baseUrl/user/account/balance'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Use the resolved token
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['balance'] is String)
          ? double.tryParse(data['balance'])
          : data['balance'].toDouble();
    } else {
      return null;
    }
  }
}
