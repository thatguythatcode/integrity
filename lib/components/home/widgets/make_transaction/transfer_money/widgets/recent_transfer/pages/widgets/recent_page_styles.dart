// recent_page_styles.dart

import 'package:flutter/material.dart';

class RecentPageStyles {
  // Avatar Background Color
  static const Color avatarBackgroundColor = Colors.blueAccent;

  // Text Styles
  static const TextStyle nameTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle accountNumberTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  // Divider Style
  static const Divider dividerStyle = Divider(
    color: Colors.grey,
    thickness: 0.5,
    indent: 16,
    endIndent: 16,
  );
}
