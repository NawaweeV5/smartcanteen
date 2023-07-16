import 'package:flutter/material.dart';

import 'components/center_part.dart';
import 'components/end_part.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //top part
              //TopPart(),
              //center part
              CenterPart(),
              //end part
              EndPart(),
            ],
          ),
        ),
      ),
    );
  }
}
