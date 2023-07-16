import 'package:flutter/material.dart';

class CenterPart extends StatelessWidget {
  const CenterPart({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(child: Image.asset("images/logosmartcanteen.png"));
  }
}
