import 'package:flutter/material.dart';

class ageButton extends StatefulWidget {
  final Function(int) onChange;

  final String title;

  final int initValue;

  final int min;

  final int max;

  const ageButton(
      {Key? key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max})
      : super(key: key);

  @override
  _ageButtonState createState() => _ageButtonState();
}

class _ageButtonState extends State<ageButton> {
  int counter = 0;
bool darkTheme = false;
  int currentindex = 0;

void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  color:  darkTheme ? Colors.black12:Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: kElevationToShadow[1]
          
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title,
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                          child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Color.fromARGB(255, 255, 197, 24),
                            child: Icon(Icons.remove, color: Colors.black),
                          ),
                          onTap: () {
                            setState(() {
                              if (counter > widget.min) {
                                counter--;
                              }
                            });
                            widget.onChange(counter);
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          counter.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Color.fromARGB(255, 255, 197, 24),
                            child: Icon(Icons.add, color: Colors.black),
                          ),
                          onTap: () {
                            setState(() {
                              if (counter < widget.max) {
                                counter++;
                              }
                            });
                            widget.onChange(counter);
                          },
                        ),
                      ],
                    ),
                  )
                ]))
                   
                );
     
            
  }
}