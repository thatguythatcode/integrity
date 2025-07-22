import 'package:flutter/material.dart';

class UpgradeWidget extends StatelessWidget {
  final double progressPercentage;

  const UpgradeWidget({
    super.key,
    required this.progressPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 358,
        height: 153,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(color: const Color(0xFF919191), width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(child: _buildTextContent()),
            const SizedBox(width: 39),
            _buildProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'KYC Not Completed',
          style: TextStyle(
            color: Color(0xFF0A0A0A),
            fontSize: 20,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Verify your KYC to access unlimited transfers and qualify for bank overdraft.',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 12,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            // Define the action to be taken when "Complete Setup" is tapped
            print("Complete Setup clicked");
            // You can add navigation or other actions here
          },
          child: const Text(
            'Complete Setup',
            style: TextStyle(
              color: Color(0xFF1F4799),
              fontSize: 14,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 68.0,
              height: 68.0,
              child: CircularProgressIndicator(
                value: progressPercentage / 100, // Progress as a fraction
                color: const Color(0xFF0B7B69),
                backgroundColor: const Color(0xFFD9D9D9),
                strokeWidth: 6,
              ),
            ),
            Text(
              '${progressPercentage.toInt()}%', // Display percentage in center
              style: const TextStyle(
                color: Color(0xFF3E3F42),
                fontSize: 14,
                fontFamily: 'Euclid Circular A',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
