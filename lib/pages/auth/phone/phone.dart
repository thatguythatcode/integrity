import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/auth_service.dart';

import 'phone_otp/otp.dart';

class PhonePage extends StatefulWidget {
  final String token;

  const PhonePage({super.key, required this.token});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final TextEditingController _phoneController = TextEditingController();
  bool isLoading = false;
  String? _errorMessage;

  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _sendPhoneOtp() async {
    setState(() {
      isLoading = true;
      _errorMessage = null; // Clear previous error messages
    });

    final phoneNumber = _phoneController.text.trim();
    if (phoneNumber.isEmpty || phoneNumber.length < 10) {
      setState(() {
        isLoading = false;
        _errorMessage = 'Please enter a valid phone number.';
      });
      return;
    }

    try {
      // Call the sendPhoneOtp method from AuthService
      final response =
          await _authService.sendPhoneOtp(widget.token, phoneNumber);

      // Assuming successful response, navigate to the verification page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyPhonePage(
            token: response['token'],
          ),
        ),
      );
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/signup/signupbg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Image.asset(
                  "assets/images/logo/logo2.png",
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: "Enter your phone number",
                    hintStyle: const TextStyle(
                      color: Color(0xFFD1D1D1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: isLoading ? null : _sendPhoneOtp,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFE9EDF5),
                    backgroundColor: const Color(0xFF1F4799),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Verify'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}
