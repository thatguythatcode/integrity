import 'package:flutter/material.dart';

class OtherBank extends StatefulWidget {
  const OtherBank({super.key});

  @override
  State<OtherBank> createState() => _OtherBankState();
}

class _OtherBankState extends State<OtherBank> {
  final TextEditingController _accountController = TextEditingController();
  bool _isButtonEnabled = false;
  String? _selectedBank;

  final List<String> _banks = [
    'Access Bank',
    'Zenith Bank',
    'GTBank',
    'First Bank',
    'UBA',
    'Union Bank',
    'Fidelity Bank',
    'FCMB',
    'Sterling Bank',
    'Ecobank',
  ];

  void _onAccountNumberChanged(String value) {
    setState(() {
      _isButtonEnabled = value.length == 10 && _selectedBank != null;
    });
  }

  void _onBankSelected(String? bank) {
    setState(() {
      _selectedBank = bank;
      _isButtonEnabled = _accountController.text.length == 10 && _selectedBank != null;
    });
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
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
                  onChanged: _onAccountNumberChanged,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Bank',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedBank,
                  hint: const Text(
                    'Select Bank',
                    style: TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  items: _banks.map((String bank) {
                    return DropdownMenuItem<String>(
                      value: bank,
                      child: Text(bank),
                    );
                  }).toList(),
                  onChanged: _onBankSelected,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF0A0A0A)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: _isButtonEnabled ? () {} : null,
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
          ),
        ],
      ),
    );
  }
}
