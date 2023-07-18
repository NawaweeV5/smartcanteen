import 'package:flutter/material.dart';

import '../../../widgets/my_button.dart';

class EndPartLogin extends StatelessWidget {
  const EndPartLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
