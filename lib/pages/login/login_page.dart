import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcanteen/pages/login/components/center_part.dart';
import 'package:smartcanteen/pages/login/components/end_part.dart';
import 'package:smartcanteen/pages/login/components/top_part.dart';

import 'components/login_auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    LoginAuthProvider loginAuthProvider =
        Provider.of<LoginAuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // top part/
            const TopPartLogin(),
            // center part
            CenterPartLogin(
              email: email,
              password: password,
              obscureText: visible,
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              icon: Icon(
                visible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            //end part
            EndPartLogin(
              loading: loginAuthProvider.loading,
              onPressed: () {
                loginAuthProvider.LoginValidation(
                  email: email,
                  password: password,
                  context: context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
