import 'package:flutter/material.dart';
import 'package:ingeritypay/components/nav_bar/main_nav_page.dart';

class TransferSuccessfulPage extends StatelessWidget {
  const TransferSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Success Icon or Message
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            // Success Message
            Text(
              'Transfer Successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            // Success Sub-message (optional)
            Text(
              'Your transfer has been completed successfully.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NavMainPage())); 
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            backgroundColor: const Color(0xFF1F4799), // Home button color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Go to Home', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
