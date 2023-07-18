import 'package:flutter/material.dart';

import '../../../widgets/my_button.dart';

class CenterPartLogin extends StatelessWidget {
  const CenterPartLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Email",
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.visibility),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            MyButton(
              onPressed: () {},
              text: "Login",
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Don't have an account?\t\t"), Text("Signup")],
            )
          ],
        ),
      ],
    );
  }
}
