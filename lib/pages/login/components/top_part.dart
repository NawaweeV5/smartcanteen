import 'package:flutter/material.dart';

class TopPartLogin extends StatelessWidget {
  const TopPartLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            ClipRRect(
              //borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "images/logosmartcanteen.png",
                scale: 2,
              ),
            ),
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}
