import 'package:flutter/material.dart';
import 'package:ingeritypay/pages/main/Settings/settings_page.dart';
import 'package:ingeritypay/pages/main/finance/finance_page.dart';
import 'package:ingeritypay/pages/main/home/home_page.dart';
import 'package:ingeritypay/pages/main/overdraft/overdraft_page.dart';


class NavMainPage extends StatefulWidget {
  const NavMainPage({super.key});

  @override
  State<NavMainPage> createState() => _NavMainPageState();
}

class _NavMainPageState extends State<NavMainPage> {
  int _bottomNavIndex = 0;

    final List<Map<String, String>> iconImages = [
    {'active': 'assets/images/icons/home-solid.png', 'inactive': 'assets/images/icons/home-outline.png'},
    {'active': 'assets/images/icons/overdraft-solid.png', 'inactive': 'assets/images/icons/overdraft-outline.png'},
    {'active': 'assets/images/icons/finance-solid.png', 'inactive': 'assets/images/icons/finance-outline.png'},
    {'active': 'assets/images/icons/settings-solid.png', 'inactive': 'assets/images/icons/settings-outline.png'}
  ];

  final List<String> iconLabels = ["Home", "Overdraft", "Fincase", "Settings"];

  // Pages for each tab
  final List<Widget> _pages = [
    const HomePage(),
    const OverDraftPage(),
    const Finance(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_bottomNavIndex], // Displays the current selected page
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1F4799),
        shape: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/icons/scan.png', 
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconImages.length, (index) {
            final isActive = _bottomNavIndex == index;
            final image = isActive ? iconImages[index]['active'] : iconImages[index]['inactive'];
            final color = isActive ? const Color(0xFF1F4799) : const Color(0xFF0B0B0B);

            return GestureDetector(
              onTap: () => setState(() => _bottomNavIndex = index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image!,
                    width: 24,
                    height: 24,
                    color: color,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    iconLabels[index],
                    style: TextStyle(color: color, fontSize: 12, fontFamily: 'Lato', fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
