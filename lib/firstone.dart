/*
import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _txt="See the answer here";

  num a = 10, b = 5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal,Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border(
                bottom: BorderSide(
                  color: Colors.black26,
                  width: 2.0,
                ),
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: const Center(
                child: Text(
                  "Calculator",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    shadows: [Shadow(
                      offset: Offset(2.0, 2.0), // Shadow offset
                      blurRadius: 0.0, // Shadow blur radius
                      color: Colors.white60, // Shadow color with opacity
                    ),]
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Center(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal.shade100,
                ),
                  onPressed: (){
                    setState(() {
                      num r=0;
                      r=a+b;
                      _txt='The ans of $a+$b is ';
                      _txt +=' $r'.toString();
                    });
                  },
                  child: Text(
                      '$a + $b',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade800,
                        shadows: [Shadow(
                          offset: Offset(1.0, 2.0), // Shadow offset
                          blurRadius: 1.0, // Shadow blur radius
                          color: Colors.white, // Shadow color with opacity
                        ),]
                    ),
                  ),
              ),
              SizedBox(width: 20,),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal.shade100,
                ),
                  onPressed: (){
                    setState(() {
                      num ans=0;
                      ans=a-b;
                      _txt='The ans of $a - $b is ';
                      _txt+='$ans'.toString();
                    });
                  },
                  child: Text(
                      '$a - $b',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800,
                      shadows: [Shadow(
                        offset: Offset(1.0, 2.0), // Shadow offset
                        blurRadius: 1.0, // Shadow blur radius
                        color: Colors.white, // Shadow color with opacity
                      ),]
                    ),
                  )),
              SizedBox(width: 20,),
              Text(
                  _txt,
              style: TextStyle(
                color: Colors.teal.shade500
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
 */