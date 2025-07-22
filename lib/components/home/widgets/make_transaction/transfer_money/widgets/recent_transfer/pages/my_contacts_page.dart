import 'package:flutter/material.dart';

class MyContactsPage extends StatelessWidget {
  const MyContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/icons/empty.png",
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 16),
          const Text(
            'You have no recent Contacts',
            style: TextStyle(
              color: Color(0xFFBAC6DF),
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
