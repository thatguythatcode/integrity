import 'package:flutter/material.dart';
import 'package:ingeritypay/backend/auth_service/transaction_service.dart';
import 'package:ingeritypay/backend/auth_service/user_service.dart';

import 'send_money.dart';

class IntegrityBank extends StatefulWidget {
  const IntegrityBank({super.key});

  @override
  State<IntegrityBank> createState() => _IntegrityBankState();
}

class _IntegrityBankState extends State<IntegrityBank> {
  final TextEditingController _accountController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _isUserFound = false;
  String? _firstName;
  String? _lastName;
  String? _errorMessage;
  String? _senderAccountNumber;

  @override
  void initState() {
    super.initState();
    _fetchSenderData();
  }

  // Fetch the logged-in user's data (sender data)
  Future<void> _fetchSenderData() async {
    final userService = UserService();
    try {
      final senderData = await userService.fetchUserData();
      setState(() {
        _senderAccountNumber = senderData?['accountNumber'];
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching sender data';
      });
      print('Error fetching sender data: $e');
    }
  }

  // Fetch receiver data based on phone number
  Future<void> _fetchReceiverData(String phoneNumber) async {
    final transactionService = TransactionService();
    try {
      final userData = await transactionService.getUserByAccountNumber(phoneNumber);
      setState(() {
        _firstName = userData['firstName'];
        _lastName = userData['lastName'];
        _isUserFound = true;
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _firstName = null;
        _lastName = null;
        _isUserFound = false;
        _errorMessage = 'Error fetching user data';
      });
      print('Error fetching user data: $e');
    }
  }

 // Validate account number input and fetch receiver data
void _onAccountNumberChanged() {
  final phoneNumber = _accountController.text;

  // Check if the phone number has 10 digits
  if (phoneNumber.length == 10) {
    setState(() {
      _isButtonEnabled = true; // Enable button when phone number is 10 digits
    });
    _fetchReceiverData(phoneNumber); // Fetch receiver data if valid
  } else {
    setState(() {
      _isButtonEnabled = false; // Disable button if phone number is not 10 digits
      _isUserFound = false; // Reset user found flag
      _errorMessage = phoneNumber.isEmpty ? null : 'Phone number must be 10 digits';
      _firstName = null; // Clear receiver info
      _lastName = null;
    });
  }
}

  // Navigate to send money page
 void _goToSendMoneyPage(String accountNumber) {
  if (_senderAccountNumber != null && _firstName != null && _lastName != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InternalTransferPage(
          accountNumber: accountNumber,
          senderAccountNumber: _senderAccountNumber!,
          firstName: _firstName!,  // Pass first name
          lastName: _lastName!,    // Pass last name
        ),
      ),
    );
  } else {
    print('Sender account or user data is missing, cannot navigate');
  }
}


  @override
  void dispose() {
    _accountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          _buildAccountNumberField(),
          const SizedBox(height: 16),
          if (_errorMessage != null) _buildErrorMessage(),
          if (_isUserFound) _buildReceiverInfo(),
          const SizedBox(height: 24),
          _buildNextButton(),
        ],
      ),
    );
  }

  // Widget to build the account number input field
  Widget _buildAccountNumberField() {
    return Container(
      width: 358,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account Number',
            style: TextStyle(
              color: Color(0xFF1A1A1A),
              fontSize: 14,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _accountController,
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
              hintText: 'Enter 10 digits account number',
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
            onChanged: (value) => _onAccountNumberChanged(),
          ),
        ],
      ),
    );
  }

  // Widget to display the error message
  Widget _buildErrorMessage() {
    return Container(
      width: 340,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: ShapeDecoration(
        color: const Color(0xFFBAC6DF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Row(
        children: [
          SizedBox(width: 8),
          Icon(
            Icons.error,
            color: Colors.red,
            size: 15,
          ),
          SizedBox(width: 8),
          Text(
              "This account number doesn't exist",
            style: TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 15,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // Widget to display receiver information
  Widget _buildReceiverInfo() {
    return Container(
      width: 340,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: ShapeDecoration(
        color: const Color(0xFFBAC6DF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Icon(
            Icons.person,
            color: Colors.black,
            size: 15,
          ),
          const SizedBox(width: 8),
          Text(
            '$_firstName $_lastName',
            style: const TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 15,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build the next button
  Widget _buildNextButton() {
    return GestureDetector(
            onTap: _isButtonEnabled ? () {
              _goToSendMoneyPage(_accountController.text);
            } : null,
            child: Container(
              width: 358,
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
                    'Next',
                    style: TextStyle(
                      color: Color(0xFFE9EDF5),
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
