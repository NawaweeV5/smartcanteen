import 'package:flutter/material.dart';
import 'package:smartcanteen/pages/register/register.dart';

import '../../../widgets/my_button.dart';

class EndPartLogin extends StatelessWidget {
  final void Function()? onPressed;
  final bool loading;
  const EndPartLogin({
    required this.loading,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loading == true
            ? CircularProgressIndicator()
            : MyButton(
                onPressed: onPressed,
                text: "Login",
              ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?\t\t"),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: Text("Signup"),
            ),
          ],
        )
      ],
    );
  }
}
