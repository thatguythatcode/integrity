import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/auth_service.dart';
import 'package:ingeritypay/pages/auth/complete/complete_profile.dart';
import 'package:pinput/pinput.dart';

class VerifyPhonePage extends StatefulWidget {
  final String token;

  const VerifyPhonePage({super.key, required this.token});

  @override
  State<VerifyPhonePage> createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _errorMessage;
  int _cooldownSeconds = 59;
  Timer? _timer;

  @override
  void dispose() {
    _otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startCooldown() {
    setState(() {
      _cooldownSeconds = 59;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_cooldownSeconds > 0) {
        setState(() {
          _cooldownSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _verifyPhoneOtp() async {
    if (!_isLoading && formKey.currentState?.validate() == true) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        final response = await _authService.verifyPhoneOtp(widget.token, _otpController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('OTP verified successfully')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompleteProfilePage(token: response['token']),
          ),
        );
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
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: Color.fromRGBO(30, 60, 87, 1)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/icons/otp.png", width: 80, height: 80),
            ),
            const SizedBox(height: 20),
            const Text("Phone Number Verification", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "Enter the OTP sent to your phone number.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Pinput(
                    controller: _otpController,
                    defaultPinTheme: defaultPinTheme,
                    length: 6,
                    validator: (value) => value?.length == 6 ? null : 'Enter a valid 6-digit PIN',
                    onCompleted: (_) => _verifyPhoneOtp(),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(border: Border.all(color: focusedBorderColor)),
                    ),
                  ),
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
                    ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: _cooldownSeconds == 0 ? _startCooldown : null,
                    child: Text(
                      _cooldownSeconds > 0 ? "Resend code in $_cooldownSeconds sec" : "Resend OTP",
                      style: const TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                  if (_isLoading) const CircularProgressIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
