import 'package:flutter/material.dart';
import 'package:smartcanteen/appColors/app_colors.dart';

class TopPartLogin extends StatelessWidget {
  const TopPartLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                      color: AppColors.kblackColor,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
