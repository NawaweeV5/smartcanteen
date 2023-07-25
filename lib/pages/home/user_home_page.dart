import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        shadowColor: Colors.transparent,
        title: Text("Home"),
      ),
      backgroundColor: Colors.blue[700],
      body: Column(
        children: [
          Text("Ameen"),
        ],
      ),
    );
  }
}
