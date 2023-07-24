import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AdminBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  AdminBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.white,
          color: Colors.grey[300],
          tabActiveBorder: Border.all(color: Colors.white),
          gap: 8,
          tabs: const [
            // home tap
            GButton(
              icon: Icons.home,
              text: 'Home Admin',
            ),
            // shop tap
            GButton(
              icon: Icons.fastfood,
              text: 'Shop Admin',
            ),
            // account tap
            GButton(
              icon: Icons.account_circle,
              text: 'Account Users',
            ),
          ]),
    );
  }
}
