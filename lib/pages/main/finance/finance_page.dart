import 'package:flutter/material.dart';
import 'package:ingeritypay/components/finance/finance_coming_away_section.dart';
import 'package:ingeritypay/components/finance/finance_top_section.dart';
import 'package:ingeritypay/components/finance/financial_journey_section.dart';

class Finance extends StatelessWidget {
  const Finance({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FinanceTopSection(),
              SizedBox(height: 50),
              FinanceComingAwaySection(),
               SizedBox(height: 50),
              FinancialJourneySection(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
