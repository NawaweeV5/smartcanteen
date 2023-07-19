import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartcanteen/pages/home/home_page.dart';

class LoginAuthProvider with ChangeNotifier {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(LoginAuthProvider.pattern.toString());

  bool loading = false;

  UserCredential? userCredential;

  void LoginValidation(
      {required TextEditingController? email,
      required TextEditingController? password,
      required BuildContext context}) async {
    if (email!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email is empty!"),
        ),
      );
      return;
    } else if (!regExp.hasMatch(email.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email!"),
        ),
      );
      return;
    } else if (password!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password is empty!"),
        ),
      );
      return;
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be 8 !"),
        ),
      );
      return;
    } else {
      try {
        loading = true;
        notifyListeners();
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        )
            .then(
          (value) async {
            loading = false;
            notifyListeners();
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        );
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        loading = false;
        notifyListeners();
        if (e.code == "user-not-found") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("User not found"),
            ),
          );
        } else if (e.code == "wrong-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Wrong password!"),
            ),
          );
        }
      }
    }
  }
}
