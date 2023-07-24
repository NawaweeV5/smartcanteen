import 'package:flutter/material.dart';
import 'package:smartcanteen/components/admin_bottom_nav_bar.dart';
import 'package:smartcanteen/pages/admin_home/account_user.dart';
import 'package:smartcanteen/pages/admin_home/admin_home.dart';
import 'package:smartcanteen/pages/admin_home/admin_shop.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _SelectedIndex = 0;
  void navigateBottomBar(int newIndex) {
    setState(() {
      _SelectedIndex = newIndex;
    });
  }

  final List<Widget> _pages = [
    // home page
    const AdminHome(),
    // shop page
    const AdminShop(),
    // account page
    const AdminAccountUsers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      bottomNavigationBar: AdminBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_SelectedIndex],
    );
  }
}
