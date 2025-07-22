import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // For iOS forward icon

class OverdraftEligible extends StatelessWidget {
  const OverdraftEligible({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1F4799), // Blue background
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // "Not Eligible" (Top Left)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Not Eligible',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // "Eligibility Check" (Top Right)
              const Row(
                children: [
                  Text(
                    'Eligibility Check',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Icon(
                    CupertinoIcons.forward, // iOS forward icon
                    color: Colors.white,
                    size: 16.0,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // "Loanable Amount" (Bottom Left)
              Text(
                'Loanable Amount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                ),
              ),
              // "Loan Period" (Bottom Right)
              Text(
                'Loan Period',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Loanable Amount Value
              const SizedBox(
                width: 139,
                child: Text(
                  '₦0.00k',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // Loan Period "-" and Button
              Column(
                children: [
                  // Dash ("-")
                  const Text(
                    '-',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // "Apply for Overdraft" Button
                  Container(
                    width: 159,
                    height: 37,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFAAAAAA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Apply for overdraft',
                        style: TextStyle(
                          color: Color(0xFFD1D1D1),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                     
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
