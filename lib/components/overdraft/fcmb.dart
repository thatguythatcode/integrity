import 'package:flutter/material.dart';

class FcmbSection extends StatelessWidget {
  const FcmbSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF5C2684),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildActionRow(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Text(
            "Eligibility Note: To qualify for overdraft, you must have an FCMB account. Sign up today to unlock this benefit and more!",
            style: TextStyle(
              color: Color(0xFFF6F6F6),
              fontSize: 14,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/logo/fcmb.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Create Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 4),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 16,
        ),
      ],
    );
  }
}
