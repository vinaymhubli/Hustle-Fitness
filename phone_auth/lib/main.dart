import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/auth/phone-auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PHONE_AUTH',
      debugShowCheckedModeBanner: false,
      color: Colors.indigo.shade900,
      theme: ThemeData(
          buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side:
            BorderSide(color: Colors.white, style: BorderStyle.solid, width: 1),
      ))),
      home: LoginScreen(),
    );
  }
}
