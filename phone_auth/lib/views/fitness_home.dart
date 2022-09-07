import 'package:flutter/material.dart';
import 'package:phone_auth/bmi_calculator/bmi_calculator.dart';
import 'package:phone_auth/diet-recipes/recipes_home.dart';
import 'package:phone_auth/workout/workout_home.dart';

class FitnessHome extends StatefulWidget {
  FitnessHome({Key? key}) : super(key: key);

  @override
  State<FitnessHome> createState() => _FitnessHomeState();
}

class _FitnessHomeState extends State<FitnessHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 19, 19, 19),
        elevation: 0.0,
      ),
      backgroundColor: Color.fromARGB(255, 19, 19, 19),
      body: Container(
        child: Column(
          children: [
            Image.asset('assets/images/background_image.jpg'),
            FlatButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BMICalculator()));
                },
                color: Colors.white12,
                icon: Icon(
                  Icons.calculate_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  'BMI Calculator',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 10.0),
            FlatButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecepesHome()));
                },
                color: Colors.white12,
                icon: Icon(
                  Icons.food_bank,
                  color: Colors.white,
                ),
                label: Text(
                  'Diet-Recipes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 10.0),
            FlatButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WorkoutHome()));
                },
                color: Colors.white12,
                icon: Icon(
                  Icons.fitness_center_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  'Workout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
