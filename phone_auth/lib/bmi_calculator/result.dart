import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phone_auth/bmi_calculator/bmi_calculator.dart';
import 'package:phone_auth/views/fitness_home.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ResultScreen extends StatelessWidget {
  final double bmiScore;

  final int age;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  ResultScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 255, 197, 24),
            ),
            onPressed: () {}),
        backgroundColor: Color.fromARGB(255, 255, 197, 24),
        centerTitle: true,
        title: Text("Hustle Fitness",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        elevation: 0.0,
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Your Score",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        GaugeSegment('UnderWeight', 18.5, Colors.red),
                        GaugeSegment('Normal', 6.4, Colors.green),
                        GaugeSegment('OverWeight', 5, Colors.orange),
                        GaugeSegment('Obese', 10.1, Colors.pink),
                      ],
                      valueWidget: Text(
                        bmiScore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40),
                      ),
                      currentValue: bmiScore.toDouble(),
                      needleColor: Color.fromARGB(255, 255, 197, 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiStatus!,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: bmiStatusColor!,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiInterpretation!,
                      style: const TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 255, 197, 24),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0))),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BMICalculator()));
                            },
                            child: const Text(
                              "Re-calculate",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 255, 197, 24),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0))),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    child: FitnessHome(),
                                    type: PageTransitionType.fade,
                                  ));
                            },
                            child: const Text("Close",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                      ],
                    )
                  ]))),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
    }
  }
}
