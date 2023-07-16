import 'package:flutter/material.dart';
import '../../../widgets/my_button.dart';

class EndPart extends StatelessWidget {
  const EndPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(onPressed: () {}, text: "Login"),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            print("Click");
          },
          child: const Text(
            "Register",
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
