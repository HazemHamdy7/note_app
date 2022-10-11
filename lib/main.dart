import 'package:flutter/material.dart';
import 'package:noteapp/app/auth/signup.dart';
import 'package:noteapp/app/auth/success.dart';
import 'package:noteapp/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/auth/login.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: sharedPref.getString("id") == null ? "login" : "home",
        routes: {
          "login": (context) => const Login(),
          "signup": (context) => const SignUp(),
          "home": (context) => const HomePage(),
          "success": (context) => const Success()
        });
  }
}
