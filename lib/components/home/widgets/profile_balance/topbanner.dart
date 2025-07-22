// top_banner.dart
import 'package:flutter/material.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 403,
      decoration: const ShapeDecoration(
        color: Color(0xFFBAC6DF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(54),
            bottomRight: Radius.circular(54),
          ),
        ),
      ),
    );
  }
}
