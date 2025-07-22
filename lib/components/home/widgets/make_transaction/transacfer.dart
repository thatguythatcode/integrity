import 'package:flutter/material.dart';
import 'package:ingeritypay/components/home/widgets/make_transaction/transfer_money/transfer_money.dart';

class TransferRequestButtons extends StatelessWidget {
  const TransferRequestButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 13.0
      ),
      child: SizedBox(
        width: 358,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButton(
              color: const Color(0xFF1F4799),
              borderColor: Colors.transparent,
              icon: Icons.arrow_upward_outlined,
              text: 'Transfer',
              textColor: const Color(0xFFFAFAFA),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TransferMoneyPage()));
              },
            ),
            const SizedBox(width: 17),
            _buildButton(
              color: Colors.transparent,
              borderColor: const Color(0xFF1F4799),
              icon: Icons.arrow_downward,
              text: 'Request',
              textColor: const Color(0xFF1F4799),
              onTap: () {
                // Handle Request button tap
                print('Request button tapped');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required Color color,
    required Color borderColor,
    required IconData icon,
    required String text,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 56,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: borderColor, width: 2),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: textColor),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
