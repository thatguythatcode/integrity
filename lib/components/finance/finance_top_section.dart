import 'package:flutter/material.dart';

class FinanceTopSection extends StatelessWidget {
  const FinanceTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Image.asset("assets/images/logo/comingsoon.png",),
          const SizedBox(height: 16),
          // Title Text
          const SizedBox(
            width: 358,
            child: Text(
              "Coming Soon: Save and Invest with Ease",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
              
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Description Text
          const SizedBox(
            width: 358,
            child: Text(
              "Start building a better financial future. Our new app makes saving and investing simple, automated, and accessible—all in one place.",
              textAlign: TextAlign.center,
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
    );
  }
}
