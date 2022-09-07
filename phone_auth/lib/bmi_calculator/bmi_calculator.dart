import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phone_auth/bmi_calculator/result.dart';
import 'package:phone_auth/bmi_calculator/widget.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class BMICalculator extends StatefulWidget {
 

  BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  int _height =100;
  int _age = 15;
  int _weight = 30;
  int currentindex = 0;
  bool darkTheme = false;
  bool _isFinished=false;
  double _bmiResult=0;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Change Theme",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                trailing: Switch(
                  value: darkTheme,
                  onChanged: (changed) {
                    setState(() {
                      darkTheme = changed;
                    });
                  },
                ),
              )
            ],
          ),
        ),
        
        appBar: AppBar(
          backgroundColor: darkTheme?Colors.black12:Color.fromARGB(255, 255, 197, 24),
          title: Text(
            "Hustle Fitness",
            style: TextStyle(fontWeight: FontWeight.bold, 
            color: darkTheme?Colors.white:Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkTheme?Colors.white:Colors.black),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: darkTheme?Colors.white:Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("MEN ♂", Color.fromARGB(255, 6, 91, 161), 0),
                    radioButton("WOMEN♀", Color.fromARGB(255, 203, 5, 71), 1),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 7.0),
                  decoration: BoxDecoration(
                      color: darkTheme?Colors.black12:Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: kElevationToShadow[1]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Text(
                            "Height",
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_height.toString(),
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold)),
                          SizedBox(width: 2.0),
                          Text(
                            'cm',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                          )
                        ],
                      ),
                      Slider(
                        activeColor:darkTheme?Colors.white:Color.fromARGB(255, 255, 197, 24),
                        inactiveColor: darkTheme?Colors.white.withOpacity(0.5):Color.fromARGB(255, 255, 197, 24).withOpacity(0.5),
                        thumbColor: darkTheme?Colors.white:Colors.black,
                        min: 0,
                        max: 240,
                        value: _height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _height = value.toInt();
                          });
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    ageButton(
                      onChange: (ageVal) {
                        _age = ageVal;
                      },
                      title: 'Age',
                      initValue: 15,
                      min: 10,
                      max: 100,
                    ),
                    ageButton(
                      onChange: (weightVal) {
                        _weight = weightVal;
                      },
                      title: 'Weight (Kg)',
                      initValue: 30,
                      min: 40,
                      max: 180,
                    )
                  ],
                ),
                SizedBox(height: 35.0),
                SwipeableButtonView(isFinished: _isFinished,
                  onFinish: ()async{
                    await Navigator.pushReplacement(context, PageTransition(child: ResultScreen(  
                      bmiScore: _bmiResult,
                      age: _age,
                    ), type: PageTransitionType.fade));
                    // setState(() {
                    //   _isFinished=false;
                    // });
                  },
                 onWaitingProcess: (){
                  calculateBmi();
                  Future.delayed(Duration(seconds: 2),(){
                    setState(() {
                      _isFinished=true;
                    });
                  });
                 },
                  activeColor: Color.fromARGB(255, 255, 197, 24),
                   buttonWidget: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,),
                    buttonText: 'Calculate',
                    buttontextstyle: TextStyle(fontSize: 25.0,color: Colors.black,fontWeight: FontWeight.bold),
                    )
              ],
            ),
          ),
        ),
      ),
      theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
    );
  }

  
  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
                color: currentindex == index
                    ? color
                    : darkTheme
                        ? Colors.black12
                        : Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: kElevationToShadow[1]),
            height: 140.0,
            child: FlatButton(
              onPressed: () {
                changeIndex(index);
              },
              child: Text(
                value,
                style: TextStyle(
                    color: currentindex == index ? Colors.white : color,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            )));
  }
   void calculateBmi() {
    _bmiResult = _weight / pow(_height / 100, 2);
  }
}
