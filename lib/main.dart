import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String expression = '';  // To store the current expression
  // Function to handle number and operator button presses
  void numClick(String text) {
    setState(() {
      expression += text;
    });
  }
  // Function to clear all inputs and result
  void allClear(String text) {
    setState(() {
      expression = '';
    });
  }
  // Function to evaluate the expression
  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(expression.replaceAll('x', '*'));
    ContextModel cm = ContextModel();
    num eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      if(eval is int || eval==eval.roundToDouble()){
        expression = eval.toInt().toString();
      }
      else {
        expression = eval.toString();
      }
    });
  }

  void del(String text){
    setState(() {
      if(expression.isNotEmpty){
        expression = expression.substring(0,expression.length-1);
      }
    });
  }
  // Function to clear the current input
  void clear(String text) {
    setState(() {
      expression = '';
    });
  }
  //chatgpt

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.tealAccent,Colors.teal],
            ),
            border: Border(
              bottom: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "Calculator",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(
                  offset: Offset(2.0,1.0),
                  color: Colors.black,
                  blurRadius: 0.0,
                )]
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    expression,  // Displaying the current expression CHAT GPT
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                    ),
                  ),
                  SizedBox(width: 35,)
                ],
              ),
              SizedBox(height: 10,),
              Divider(
                color: Colors.white,
                thickness: 2,
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.tealAccent,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                    onPressed: (){
                      setState(() {
                        allClear('');  // Update expression with '1' CHAT GPT
                      });
                    },
                    child: Text(
                      'C',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.tealAccent,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(28.5),
                    ),
                    onPressed: (){
                      setState(() {
                        numClick('%');  // Update expression with '2' CHAT GPT
                      });
                    },
                    child: Text(
                      '%',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.tealAccent,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 33,vertical: 25)
                    ),
                    onPressed: (){
                      setState(() {
                        numClick('/');  // Update expression with '3' CHAT GPT
                      });
                    },
                    child: Text(
                      '/',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side:BorderSide(
                          color: Colors.tealAccent,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(22.0),
                      ),
                      onPressed: (){
                        setState(() {
                          del('');
                        });
                      },
                      child: Text(
                        'del',
                        style: TextStyle(
                            fontSize: 28
                        ),)),
                  SizedBox(width: 10,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                      onPressed: (){
                        setState(() {
                          numClick('1');  // Update expression with '1' CHAT GPT
                        });
                      },
                      child: Text(
                          '1',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                      onPressed: (){
                        setState(() {
                          numClick('2');  // Update expression with '2' CHAT GPT
                        });
                      },
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                      onPressed: (){
                        setState(() {
                          numClick('3');  // Update expression with '3' CHAT GPT
                        });
                      },
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.tealAccent,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                      onPressed: (){
                        setState(() {
                          numClick('+');
                        });
                      },
                      child: Text(
                        '+',
                      style: TextStyle(
                        fontSize: 30
                      ),)),
                  SizedBox(width: 10,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                    onPressed: (){
                      setState(() {
                        numClick('4');  // Update expression with '4' CHAT GPT
                      });
                    },
                    child: Text(
                      '4',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                    onPressed: (){
                      setState(() {
                        numClick('5');  // Update expression with '5' CHAT GPT
                      });
                    },
                    child: Text(
                      '5',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                    onPressed: (){
                      setState(() {
                        numClick('6');  // Update expression with '6' CHAT GPT
                      });
                    },
                    child: Text(
                      '6',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side:BorderSide(
                          color: Colors.tealAccent,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        shape: CircleBorder(),
                        padding: EdgeInsets.symmetric(horizontal: 31.5,vertical: 20),
                      ),
                      onPressed: (){
                        setState(() {
                          numClick('-');  // Update expression with '+' CHAT GPT
                        });
                      },
                      child: Text(
                        '-',
                        style: TextStyle(
                            fontSize: 40
                        ),)),
                  SizedBox(width: 10,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                    onPressed: (){
                      setState(() {
                        numClick('7');  // Update expression with '7' CHAT GPT
                      });
                    },
                    child: Text(
                      '7',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                    onPressed: (){
                      setState(() {
                        numClick('8');  // Update expression with '8' CHAT GPT
                      });
                    },
                    child: Text(
                      '8',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30.0),
                    ),
                    onPressed: (){
                      setState(() {
                        numClick('9');  // Update expression with '9' CHAT GPT
                      });
                    },
                    child: Text(
                      '9',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side:BorderSide(
                          color: Colors.tealAccent,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(30.5),
                      ),
                      onPressed: (){
                        setState(() {
                          numClick('x');  // Update expression with '-' CHAT GPT
                        });
                      },
                      child: Text(
                        'x',
                        style: TextStyle(
                            fontSize: 30
                        ),)),
                  SizedBox(width: 10,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      //shape: CircleBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 80,vertical:15),
                    ),
                    onPressed: (){
                      setState(() {
                        numClick('0');  // Update expression with '0' CHAT GPT
                      });
                    },
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.tealAccent,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(32.0),
                    ),
                    onPressed: (){
                      setState(() {
                        numClick('.');  // Update expression with 'x' CHAT GPT
                      });
                    },
                    child: Text(
                      '.',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side:BorderSide(
                        color: Colors.tealAccent,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                      shape: CircleBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 29,vertical: 17),
                    ),
                    onPressed: (){
                      setState(() {
                        evaluate('');  // Update expression with '%' CHAT GPT
                      });
                    },
                    child: Text(
                      '=',
                      style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  SizedBox(width: 10,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

