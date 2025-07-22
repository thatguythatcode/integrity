import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/auth_check_service.dart';
import 'package:ingeritypay/pages/splash/splash_screen.dart';

class AuthCheckPage extends StatefulWidget {
  const AuthCheckPage({super.key});

  @override
  State<AuthCheckPage> createState() => _AuthCheckPageState();
}

class _AuthCheckPageState extends State<AuthCheckPage> {
  @override
  void initState() {
    super.initState();
    // Check authentication status on app start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AuthCheckService().navigateBasedOnAuth(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Display a loading screen while checking authentication
    return const Scaffold(
      body: Center(
        child: SplashScreen(),
      ),
    );
  }
}
