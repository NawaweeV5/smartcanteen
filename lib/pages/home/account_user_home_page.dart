import 'package:flutter/material.dart';

class AccountUserHomePage extends StatefulWidget {
  const AccountUserHomePage({super.key});

  @override
  State<AccountUserHomePage> createState() => _AccountUserHomePageState();
}

class _AccountUserHomePageState extends State<AccountUserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [Text('Hello')],
          ),
        ),
      ),
    );
  }
}
