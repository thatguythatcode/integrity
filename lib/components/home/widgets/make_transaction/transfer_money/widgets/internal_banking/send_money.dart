import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/transaction_service.dart';

import 'transfer_successful.dart';

class InternalTransferPage extends StatefulWidget {
  final String accountNumber;
  final String senderAccountNumber;
  final String firstName;
  final String lastName;

  const InternalTransferPage({
    super.key,
    required this.accountNumber,
    required this.senderAccountNumber,
    required this.firstName,
    required this.lastName,
  });

  @override
  State<InternalTransferPage> createState() => _InternalTransferPageState();
}

class _InternalTransferPageState extends State<InternalTransferPage> {
  bool _isLoading = false;
  String? _errorMessage;
  bool _isButtonEnabled = false;

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  // Method to handle sending money
  Future<void> _sendMoney() async {
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      setState(() {
        _errorMessage = 'Please enter a valid amount.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final transactionService = TransactionService();
      // Pass both the sender and recipient details to the service
      await transactionService.sendMoneyToAccount(
        widget.accountNumber,
        amount,
        senderAccountNumber: widget.senderAccountNumber,
      );

      setState(() {
        _isLoading = false;
      });

      // Show success screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TransferSuccessfulPage(),
        ),
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error processing transaction.';
      });
    }
  }

  // Validate form inputs and enable/disable button
  void _validateButton() {
    setState(() {
      _isButtonEnabled = _amountController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer to Integrity',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Lato',
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        // Stack to overlay loader on top of the content
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  const SizedBox(height: 24),
                  _buildUserInfoSection(),
                  const SizedBox(height: 24),
                  _buildAmountInput(),
                  const SizedBox(height: 16),
                  _buildNoteInput(),
                  const SizedBox(height: 24),
                  _buildNextButton(),
                ],
              ),
            ),
          ),
          if (_isLoading) // Show loader when _isLoading is true
            Center(
              child: Container(
                width: double.infinity, // Full width of the screen
                height: double.infinity, // Full height of the screen
                color: Colors.black.withOpacity(0.3), // Overlay background
                child: const Center(
                  child: CircularProgressIndicator(), // Centered loader
                ),
              ),
            )
        ],
      ),
    );
  }

  // Widget for displaying user info (avatar, full name, account number)
  Widget _buildUserInfoSection() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.firstName} ${widget.lastName}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Lato',
              ),
            ),
            Text(
              widget.senderAccountNumber,
              style: const TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Widget for input field to enter the transfer amount
  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Amount',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 14,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          maxLength: 10,
          decoration: InputDecoration(
            hintText: 'Enter amount',
            hintStyle: const TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF0A0A0A)),
            ),
          ),
          onChanged: (value) => _validateButton(),
        ),
      ],
    );
  }

  // Widget for input field to enter an optional note
  Widget _buildNoteInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Note (optional)',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 14,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _noteController,
          maxLength: 50,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Enter a note',
            hintStyle: const TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF0A0A0A)),
            ),
          ),
          onChanged: (value) => _validateButton(),
        ),
      ],
    );
  }

  // Widget for the "Next" button
  Widget _buildNextButton() {
    return GestureDetector(
      onTap: _isButtonEnabled && !_isLoading
          ? _sendMoney
          : null, // Fixing the onTap logic
      child: Container(
        width: double.infinity,
        height: 56,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: _isButtonEnabled
              ? const Color(0xFF1F4799)
              : const Color(0xFFBAC6DF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Send',
              style: TextStyle(
                color: Color(0xFFE9EDF5),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
