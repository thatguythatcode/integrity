import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  final String baseUrl = dotenv.env['API_URL'] ?? 'http://10.0.2.2:3000';
    // final String baseUrl = dotenv.env['API_URL'] ?? 'https://integritybackend.onrender.com';

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  // Function to send Email OTP
  Future<Map<String, dynamic>> sendEmailOtp(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/send-email-otp'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to send email OTP");
    }
  }

  // Function to verify Email OTP
  Future<Map<String, dynamic>> verifyEmailOtp(String token, String otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/verify-email-otp'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'token': token, 'otp': otp}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to verify email OTP");
    }
  }

  // Function to send Phone OTP
  Future<Map<String, dynamic>> sendPhoneOtp(
      String token, String phoneNumber) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/send-phone-otp'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'token': token, 'phoneNumber': phoneNumber}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to send phone OTP");
    }
  }

  // Function to verify Phone OTP
  Future<Map<String, dynamic>> verifyPhoneOtp(String token, String otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/verify-phone-otp'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'token': token, 'otp': otp}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to verify phone OTP");
    }
  }

  // Function to complete user registration
  Future<Map<String, dynamic>> completeProfile(String bearerToken, String token,
      String firstName, String lastName, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $bearerToken", // Add Bearer token to header
      },
      body: jsonEncode({
        'token': token, // Token passed in the body
        'firstName': firstName,
        'lastName': lastName,
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else { 
      throw Exception(
          jsonDecode(response.body)['message'] ?? 'An error occurred');
    }
  }

  // Function to log in the user
  Future<Map<String, dynamic>> login(
      String emailOrPhone, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'emailOrPhone': emailOrPhone, 'password': password}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      await storage.write(
          key: 'token', value: data['token']); // Store token securely
      return data;
    } else {
      throw Exception("Failed to log in");
    }
  }

  // Function to get the stored JWT token
  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  // Function to check if the user is logged in
  Future<bool> isLoggedIn() async {
    final token = await getToken(); // Await the token here
    return token != null;
  }

  // Function to log out the user
  Future<void> logout() async {
    await storage.delete(key: 'token'); // Remove token from secure storage
  }
}
