import 'package:flutter/material.dart';

class FinancialJourneySection extends StatelessWidget {
  const FinancialJourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Your Financial Journey Begins Soon!',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
