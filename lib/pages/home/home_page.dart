import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartcanteen/components/bottom_nav_bar.dart';
import 'package:smartcanteen/pages/home/account_user_home_page.dart';
import 'package:smartcanteen/pages/home/cart_page.dart';
import 'package:smartcanteen/pages/home/shop_page.dart';
import 'package:smartcanteen/pages/home/user_home_page.dart';

//import '../login/login_page.dart';
//import '../route/routing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _SelectedIndex = 0;
  void navigateBottomBar(int newIndex) {
    setState(() {
      _SelectedIndex = newIndex;
    });
  }

  final List<Widget> _pages = [
    // home page
    const UserHomePage(),
    // shop page
    const ShopPage(),
    // cart page
    const CartPage(),
    // account page
    const AccountUserHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_SelectedIndex],
    );
    /* return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then(
                    (value) => RoutingPage.goTonext(
                      context: context,
                      navigateTo: LoginPage(),
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: const Center(
        child: Text("HomePage"),
      ),
    ); */
  }
}
