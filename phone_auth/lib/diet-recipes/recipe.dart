import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Recipe extends StatefulWidget {
  final String postUrl;
  Recipe({required this.postUrl});

  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late String finalUrl ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finalUrl = widget.postUrl;
    if(widget.postUrl.contains('http://')){
      finalUrl = widget.postUrl.replaceAll("http://","https://");
      print(finalUrl + "this is final url");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            
            Container(
              padding: EdgeInsets.symmetric(vertical: !kIsWeb ? Platform.isAndroid? 40: 30 : 40, horizontal: 24),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 197, 24),
                        Color.fromARGB(255, 110, 84, 16)
                        
                      ],
                      begin: FractionalOffset.topRight,
                      end: FractionalOffset.bottomLeft)),
              child:  Column(
                children: [
                 
                  Row(

                    mainAxisAlignment: 
                         MainAxisAlignment.center,
                        
                    children: <Widget>[
                    
                      Text(
                        "Hustle",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        "Fitness",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - (Platform.isAndroid? 104 : 20),
              width: MediaQuery.of(context).size.width,
              child: WebView(
                onPageFinished: (val){
                  print(val);
                },
                
                initialUrl: finalUrl,
                onWebViewCreated: (WebViewController webViewController){
                  setState(() {
                    _controller.complete(webViewController);

                  });
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}