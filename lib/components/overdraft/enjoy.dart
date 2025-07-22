import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EnjoyExtraFundsSection extends StatelessWidget {
  const EnjoyExtraFundsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text Section
        const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            SizedBox(
              width: double.infinity,
              child: Text(
                'Enjoy Instant Access to Extra Funds',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Description
            SizedBox(
              width: double.infinity,
              child: Text(
                'With our overdraft feature, you’re always covered. Tap into extra funds when you need them, so unexpected expenses are never a worry.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Lottie.asset(
          "assets/lotties/wallet.json", // Replace with your Lottie URL
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
