import 'package:flutter/material.dart';

class OverDraftTopSection extends StatelessWidget {
  const OverDraftTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40,),
      child: SizedBox(
        width: double.infinity, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: Image.asset("assets/images/icons/money.png"),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Overdraft',
                  style: TextStyle(
                    color: Color(0xFF1F4799),
                    fontSize: 24,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Access extra funds instantly when you need them.',
              style: TextStyle(
                color: Color(0xFF585858),
                fontSize: 14,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
