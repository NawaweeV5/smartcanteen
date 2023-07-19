import 'package:flutter/material.dart';

class CenterPartLogin extends StatelessWidget {
  final TextEditingController? email;
  final bool obscureText;
  final TextEditingController? password;
  final Widget icon;
  final void Function()? onPressed;

  const CenterPartLogin({
    required this.obscureText,
    required this.icon,
    required this.email,
    required this.password,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: email,
          decoration: const InputDecoration(
            hintText: "Email",
          ),
        ),
        TextFormField(
          obscureText: obscureText,
          controller: password,
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: icon,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
