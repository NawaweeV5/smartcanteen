import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcanteen/pages/register/components/register_auth_provider.dart';
import 'package:smartcanteen/pages/register/register.dart';
import 'package:smartcanteen/pages/welcome/welcome_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterAuthProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PSU SMART CANTEEN',
        theme: ThemeData(),
        home: const RegisterPage(),
      ),
    );
  }
}
