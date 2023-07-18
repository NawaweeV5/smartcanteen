import 'package:flutter/material.dart';
import 'package:smartcanteen/pages/login/components/center_part.dart';
import 'package:smartcanteen/pages/login/components/end_part.dart';
import 'package:smartcanteen/pages/login/components/top_part.dart';
import 'package:smartcanteen/pages/welcome/components/top_part.dart';
import 'package:smartcanteen/widgets/my_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top Part
            TopPartLogin(),
            // Center Part
            CenterPartLogin(),
            // End Part
            EndPartLogin(),
          ],
        ),
      ),
    );
  }
}
