import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/auth_service.dart';
import 'package:ingeritypay/pages/auth/phone/phone.dart';
import 'package:ingeritypay/pages/auth/sms_retriver.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';

class VerifyEmailPage extends StatefulWidget {
  final String token;

  const VerifyEmailPage({super.key, required this.token});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final GlobalKey<FormState> formKey;
  bool _isLoading = false;
  String? _errorMessage;
  bool isResendEnabled = false;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    smsRetriever = SmsRetrieverImpl(SmartAuth());
    _startResendTimer();
  }

  @override
  void dispose() {
    pinController.dispose();
    smsRetriever.dispose(); // Ensure proper cleanup of resources
    super.dispose();
  }

  void _startResendTimer() {
    setState(() {
      isResendEnabled = false;
    });
    Future.delayed(const Duration(seconds: 60), () {
      if (mounted) {
        setState(() {
          isResendEnabled = true;
        });
      }
    });
  }

  Future<void> _verifyEmailOtp(String otp) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await _authService.verifyEmailOtp(widget.token, otp);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhonePage(
            token: response['token'],
          ),
        ),
      );
    } catch (error) {
      setState(() {
        _errorMessage = 'Failed to verify OTP. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _resendOtp() async {
    if (isResendEnabled) {
      setState(() {
        _isLoading = true;
      });
      try {
        // await _authService.resendEmailOtp(widget.token);
        _startResendTimer();
        _showSnackBar('OTP resent successfully.');
      } catch (error) {
        _showSnackBar('Failed to resend OTP. Please try again.');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      _showSnackBar('Please wait before resending the OTP.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Email Verification',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/icons/otp.png",
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "An OTP has been sent to your email. Please enter it below.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            Form(
              key: formKey,
              child: Pinput(
                smsRetriever: smsRetriever,
                controller: pinController,
                length: 6,
                defaultPinTheme: defaultPinTheme,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Enter a valid 6-digit OTP.';
                  }
                  return null;
                },
                onCompleted: (value) {
                  if (!_isLoading) _verifyEmailOtp(value);
                },
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
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
            const SizedBox(height: 30),
            TextButton(
              onPressed: isResendEnabled ? _resendOtp : null,
              child: Text(
                isResendEnabled ? "Resend OTP" : "Resend code in 60 sec",
                style: const TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
            if (_isLoading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
