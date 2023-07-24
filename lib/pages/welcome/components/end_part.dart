import 'package:flutter/material.dart';
import 'package:smartcanteen/appColors/app_colors.dart';
import 'package:smartcanteen/pages/login/login_page.dart';
import 'package:smartcanteen/pages/register/register.dart';
import 'package:smartcanteen/pages/route/routing_page.dart';
import '../../../widgets/my_button.dart';

class EndPart extends StatelessWidget {
  const EndPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(
            onPressed: () {
              RoutingPage.goTonext(
                context: context,
                navigateTo: LoginPage(),
              );
            },
            text: "Login"),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            RoutingPage.goTonext(
              context: context,
              navigateTo: RegisterPage(),
            );
          },
          child: Text(
            "Signup",
            style: TextStyle(color: AppColors.KgreyColor),
          ),
        )
      ],
    );
  }
}
