import 'package:flutter/material.dart';
import 'package:ingeritypay/components/notification/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          // Notification card list
          NotificationCard(
            title: 'You received a deal invitation from Victor Akinnawo.',
            date: 'Nov 21, 2024',
            imagePath: 'assets/images/logo/logo2.png',
            isNew: true,
          ),

          NotificationCard(
            title: 'You received a deal invitation from Victor Akinnawo.',
            date: 'Yesterday, 3:15PM',
            imagePath: 'assets/images/logo/logo2.png', 
          ),
          // Add more NotificationCard widgets here as needed
        ],
      ),
    );
  }
}
