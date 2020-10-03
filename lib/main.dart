





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

import 'package:calculator/drawer.dart';

void main()
{
  runApp(Calculator());
}
class Calculator extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation="0";
  String result="0";
  String expression="";

  buttonPressed(String buttonText){


    setState(() {
      if (buttonText=="AC"){
        equation="0";
        result="0";
      }else if (buttonText=="del"){
        equation=equation.substring(0,equation.length -1);
        if(equation==""){
          equation="0";
        }
      }else if(buttonText=="="){
        expression=equation;
        expression=expression.replaceAll("x","*");
        try{
          Parser p= Parser();
          Expression exp=p.parse(expression);

          ContextModel cm=ContextModel();
          result='=${exp.evaluate(EvaluationType.REAL, cm)}';

        }catch(e){
          result="Invalid";

        }

      }else{
        if(equation.length <51) {
          if (equation == "0") {
            equation = buttonText;
          } else {
            equation = equation + buttonText;
          }
        }

      }

    });

  }
  Widget buildButton(String buttonText){
    return new Expanded(
        child: new MaterialButton(
          padding: new EdgeInsets.all(20.0),
          child: new Text(buttonText,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            onPressed: () => {
              buttonPressed(buttonText)

          },
          color: Colors.orangeAccent,
          textColor: Colors.black,

        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'),),

      body: new Container(

        child:
            new Column(
              children: [
                new Container(
                  alignment: Alignment.centerRight,
                    padding: new EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: new Text(equation,style: new TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),)),
                new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: new Text(result,style: new TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),)),
                new Expanded(child: new Divider(color: Colors.transparent,),
                ),
            new Column(children: [
              new Row(children: [
                buildButton("AC"),
                buildButton("("),
                buildButton(")"),
                buildButton("/")
              ],),
              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("x")
              ],),
              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("+")
              ],),
              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ],),
              new Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("del"),
                buildButton("=")
              ],),

            ],)
          ],
        ),
      ),



      drawer: MainDrawer(),
    );


  }
}
