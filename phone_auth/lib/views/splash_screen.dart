import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_auth/views/fitness_home.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FitnessHome()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Lottie.asset('assets/images/splash_screen.json'),
            SizedBox(height: 10.0),
            Text(
              'Hustle Fitness',
              style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            Lottie.asset('assets/images/blue_indicator.json', height: 250),
          ],
        ),
      ),
    );
  }
}
