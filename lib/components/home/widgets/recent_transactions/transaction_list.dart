import 'package:flutter/material.dart';
import 'package:ingeritypay/components/home/model/transaction_model.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onTap;

  const TransactionListItem({
    super.key,
    required this.transaction,
    required this.onTap,
  });

  String _getInitials(String name) {
    List<String> parts = name.split(' ');
    String initials = '';
    if (parts.isNotEmpty) {
      initials = parts[0][0]; // First letter of the first name
      if (parts.length > 1) {
        initials += parts[1][0]; // First letter of the last name (if available)
      }
    }
    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 358,
          height: 51,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: transaction.isSend
                        ? const Color(0xFF8C1823)
                        : const Color(0xFF0B7B69),
                    child: Text(
                      _getInitials(transaction.sender), 
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: transaction.isSend
                            ? const Color(0xFF8C1823)
                            : const Color(0xFF0B7B69),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        transaction.isSend
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.userDescription,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      transaction.formattedDate,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF989898),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    transaction.formattedAmount,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: transaction.isSend
                          ? const Color(0xFF8C1823)
                          : const Color(0xFF0B7B69),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
