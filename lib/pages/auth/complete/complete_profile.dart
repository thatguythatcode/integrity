import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/auth_service.dart';
import 'package:ingeritypay/pages/auth/login/login.dart';
import 'profile_input_field.dart';

class CompleteProfilePage extends StatefulWidget {
  final String token;

  const CompleteProfilePage({super.key, required this.token});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  final AuthService _authService = AuthService();
Future<void> _completeProfile() async {
  final firstName = _firstNameController.text.trim();
  final lastName = _lastNameController.text.trim();
  final password = _passwordController.text;
  final confirmPassword = _confirmPasswordController.text;

  // Validate that the passwords match
  if (password != confirmPassword) {
    setState(() {
      _errorMessage = "Passwords do not match";
    });
    return; // Exit the method if validation fails
  }

  setState(() {
    _isLoading = true;
    _errorMessage = null; // Clear previous error messages
  });

  try {
    // Use widget.token as the Bearer token and the body token
    final result = await _authService.completeProfile(
      widget.token, // Bearer token
      widget.token, // Token in the body
      firstName,
      lastName,
      password,
    );
    if (result['status'] == 'success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      setState(() {
        _errorMessage = result['message'] ?? 'Unknown error';
      });
    }
  } catch (error) {
    setState(() {
      _errorMessage = error.toString();
    });
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo/logo2.png",
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Complete your profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "To create your account, please complete your profile with the required details. Once done, you'll have full access to all features and services.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            ProfileInputField(
              label: "First Name",
              hint: "Enter your first name",
              controller: _firstNameController,
            ),
            const SizedBox(height: 20),
            ProfileInputField(
              label: "Last Name",
              hint: "Enter your last name",
              controller: _lastNameController,
            ),
            const SizedBox(height: 20),
            ProfileInputField(
              label: "Password",
              hint: "Enter your password",
              isObscured: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 20),
            ProfileInputField(
              label: "Confirm Password",
              hint: "Confirm your password",
              isObscured: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _completeProfile,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: const Color(0xFF1F4799),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Complete Profile',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
