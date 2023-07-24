import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smartcanteen/pages/admin_home/admin_home_page.dart';
import 'package:smartcanteen/pages/home/home_page.dart';
import 'package:smartcanteen/pages/login/components/login_auth_provider.dart';
import 'package:smartcanteen/pages/welcome/welcome_page.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcanteen/pages/register/components/register_auth_provider.dart';
//import 'package:smartcanteen/pages/register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PSU SMART CANTEEN',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        /*home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnp) {
            if (userSnp.hasData) {
              return HomePage();
            }
            return WelcomePage();
          },
        ),*/
        home: const AdminHomePage(),
      ),
    );
  }
}
