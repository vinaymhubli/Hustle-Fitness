import 'package:flutter/material.dart';
import 'package:phone_auth/workout/moving_data.dart';
import 'package:phone_auth/workout/moving_model.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkoutHome extends StatefulWidget {
  @override
  _WorkoutHomeState createState() => _WorkoutHomeState();
}

class _WorkoutHomeState extends State<WorkoutHome> {
   final Uri _url = Uri.parse('https://www.youtube.com/user/BeFit/videos');
  Future<void> _launchUrl() async {
    
  if (!await launchUrl(_url)) {
    
    throw 'Could not launch $_url';
  }
}
  ScrollController _scrollController1 = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  ScrollController _scrollController3 = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
      double minScrollExtent2 = _scrollController2.position.minScrollExtent;
      double maxScrollExtent2 = _scrollController2.position.maxScrollExtent;
      double minScrollExtent3 = _scrollController3.position.minScrollExtent;
      double maxScrollExtent3 = _scrollController3.position.maxScrollExtent;
      
      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 10,
          _scrollController1);
      animateToMaxMin(maxScrollExtent2, minScrollExtent2, maxScrollExtent2, 4,
          _scrollController2);
      animateToMaxMin(maxScrollExtent3, minScrollExtent3, maxScrollExtent3, 8,
          _scrollController3);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 197, 24),
        elevation: 0.0,
        title: Text(
          "Hustle Fitness",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Color.fromARGB(255, 255, 197, 24),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
               
                MoviesListView(
                  scrollController: _scrollController1,
                  images: movies1,
                ),
                MoviesListView(
                  scrollController: _scrollController2,
                  images: movies2,
                ),
                MoviesListView(
                  scrollController: _scrollController3,
                  images: movies3,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              child: Column(
                children: [
                  Text(
                    'HUSTLE',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 1.0),
                  ),
                  Text(
                    '----FOR----',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Text(
                    'THAT',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 1.0),
                  ),
                  Text(
                    'MUSCLE',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Material(
                elevation: 0,
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
                child: MaterialButton(
                  onPressed: () {
                    _launchUrl();
                  },
                  minWidth: 180,
                  height: 60,
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 197, 24),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
