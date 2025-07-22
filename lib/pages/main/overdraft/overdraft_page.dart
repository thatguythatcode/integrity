import 'package:flutter/material.dart';
import 'package:ingeritypay/components/overdraft/enjoy.dart';
import 'package:ingeritypay/components/overdraft/fcmb.dart';
import 'package:ingeritypay/components/overdraft/overdraft_eligible.dart';
import 'package:ingeritypay/components/overdraft/top_section.dart';

class OverDraftPage extends StatelessWidget {
  const OverDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OverDraftTopSection(),
              SizedBox(height: 16.0),
              OverdraftEligible(),
              SizedBox(height: 26.0),
              EnjoyExtraFundsSection(),
              SizedBox(height: 26.0),
              FcmbSection(),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
