// top_section.dart
import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/user_service.dart';
import 'package:ingeritypay/pages/main/notifications/notification.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  final UserService userService = UserService();
  String? firstName;
  String? lastName;

  @override
  void initState() {
    super.initState();
    getUserDetails(); // Fetch user details when the screen is initialized
  }

  void getUserDetails() async {
    final userData = await userService.fetchUserData(); // Use instance method
    if (userData != null) {
      setState(() {
        firstName =
            userData['firstName']; // Adjust according to your API response
        lastName =
            userData['lastName']; // Adjust according to your API response
      });
    } else {
      // print('Failed to fetch user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 390,
        height: 203,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFF007BFF),
                        child: Text(
                          '${firstName != null && firstName!.isNotEmpty ? firstName![0] : ''}${lastName != null && lastName!.isNotEmpty ? lastName![0] : ''}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, ${firstName ?? ''}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF0A0A0A),
                              fontSize: 18,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            'Lets make payments!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.headset_mic_outlined, size: 24),
                        onPressed: () {
                          // Handle the headset mic icon press
                          print('Headset mic icon pressed');
                        },
                      ),
                      const SizedBox(width: 9),
                      IconButton(
                        icon: const Icon(Icons.notifications_none_outlined,
                            size: 24),
                        onPressed: () {
                          // Navigate to the Notification Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NotificationPage()),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
