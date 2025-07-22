import 'package:flutter/material.dart';

class TopTabs extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabSelected;

  const TopTabs({
    super.key,
    required this.activeTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTab('Recents'),
        _buildTab('Beneficiary'),
        _buildTab('My Contacts'),
      ],
    );
  }

  Widget _buildTab(String tab) {
    final bool isActive = tab == activeTab;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabSelected(tab),
        child: Container(
          height: 29,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFBAC6DF) : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            tab,
            style: TextStyle(
              color: isActive ? const Color(0xFF1F4799) : Colors.black,
              fontSize: 14,
              fontFamily: 'Lato',
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
