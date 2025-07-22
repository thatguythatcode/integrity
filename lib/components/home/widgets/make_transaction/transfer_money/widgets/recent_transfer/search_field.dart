import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(999),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Color(0xFF333333)),
          SizedBox(width: 6),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: TextStyle(
                color: Color(0xFF333333),
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
