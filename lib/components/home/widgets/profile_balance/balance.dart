import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/user_service.dart';
import 'package:intl/intl.dart';

class BalanceWidget extends StatefulWidget {
  final String accountNumber;
  final String currentUserName;
  const BalanceWidget(
      {super.key, required this.accountNumber, required this.currentUserName});

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  bool _isBalanceVisible = false;
  double? _accountBalance;
  Timer? _balanceUpdateTimer;

  @override
  void initState() {
    super.initState();
    fetchAccountBalance(); // Initial balance fetch
    _startBalanceUpdateTimer(); // Start the timer
  }

  // Method to start the timer
  void _startBalanceUpdateTimer() {
    _balanceUpdateTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchAccountBalance(); // Fetch balance every 10 seconds
    });
  }

  // Method to fetch balance from the server
  Future<void> fetchAccountBalance() async {
    UserService userService = UserService();
    double? balance = await userService.fetchUserAccountBalance();
    if (mounted) {
      setState(() {
        _accountBalance = balance;
      });
    }
  }

  @override
  void dispose() {
    _balanceUpdateTimer?.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 233, 237, 245),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.5, color: Color(0xFF1F4799)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available Balance',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    _isBalanceVisible
                        ? _accountBalance != null
                            ? NumberFormat.simpleCurrency(name: 'NGN')
                                .format(_accountBalance)
                            : "0.00"
                        : '****',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F4799),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Icon(
                      _isBalanceVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 18,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isBalanceVisible = !_isBalanceVisible;
                      });
                    },
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFAFAFA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.add_circle, size: 16, color: Color(0xFF1F4799)),
                    SizedBox(width: 4),
                    Text(
                      'Fund Wallet',
                      style: TextStyle(
                          color: Color(0xFF1F4799),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tier 1',
              style: TextStyle(
                  color: Color(0xFF0A0A0A),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
