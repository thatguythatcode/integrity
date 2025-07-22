import 'package:flutter/material.dart';

class FinanceComingAwaySection extends StatelessWidget {
  const FinanceComingAwaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading Text
        const SizedBox(
          width: 358,
          child: Text(
            'What’s coming your way',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // First Item
        _buildRow(
          title: 'Effortless Saving:',
          description:
              'Set your goals, and we’ll handle the rest with automatic deposits.',
          imagePath: 'assets/images/icons/01.png',
        ),
        const SizedBox(height: 16),

        // Second Item
        _buildRow(
          title: 'Smart Investment:',
          description:
              'Explore tailored options to grow your money, no expertise needed.',
          imagePath: 'assets/images/icons/02.png',
        ),
        const SizedBox(height: 16),

        // Third Item
        _buildRow(
          title: 'Clear Insights:',
          description:
              'Track your progress in real-time and get tips to stay on course.',
          imagePath: 'assets/images/icons/03.png',
        ),
      ],
    );
  }

  // Helper method to build each row
  Widget _buildRow(
      {required String title,
      required String description,
      required String imagePath}) {
    return SizedBox(
      width: 358,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image as an Icon
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 16),

          // Text content
          Expanded(
            child: SizedBox(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 14,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: description,
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 14,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
