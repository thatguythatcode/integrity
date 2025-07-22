import 'package:flutter/material.dart';
import 'internal_banking/integrity_page.dart';
import 'other_bank_page.dart';
import 'transfer_card.dart';

class TransferWidget extends StatefulWidget {
  const TransferWidget({super.key});

  @override
  State<TransferWidget> createState() => _TransferWidgetState();
}

class _TransferWidgetState extends State<TransferWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 390,
          height: 128,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TransferCard(
                label: 'Transfer to Integrity',
                backgroundColor: selectedIndex == 0 ? const Color(0xFFBAC6DF) : const Color(0xFFE0E0E0),
                textColor: const Color(0xFF1F4799),
                icon: Icons.transfer_within_a_station,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              const SizedBox(width: 48),
              TransferCard(
                label: 'Transfer to Other Bank',
                backgroundColor: selectedIndex == 1 ? const Color(0xFFC1E9F9) : const Color(0xFFE0E0E0),
                textColor: const Color(0xFF0A0A0A),
                icon: Icons.account_balance,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        if (selectedIndex == 0) 
          const IntegrityBank()
        else 
          const OtherBank(),
      ],
    );
  }
}
