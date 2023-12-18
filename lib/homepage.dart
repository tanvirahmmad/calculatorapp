import 'package:calculatorapp/buttoncolor.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var input = "";
  var output = "";
  var operation = "";
  var hideinput = false;
  var outputsize = 34.0;

  buttononclick(value) {
    if ("AC" == value) {
      input = "";
      output = "";
    } else if ("<" == value) {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if ("=" == value) {
      if (input.isNotEmpty) {
        var userinput = input;
        userinput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userinput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();

        if (output.endsWith(".0")) {
          output = output.substring(0,output.length-1);
        }
        if(output.contains(".")){
          var f = output.split(".").first;
          var e = output.split(".").last.substring(0,1);
          output= "$f.$e";


        }

        input = output;
        hideinput = true;
        outputsize = 52;
      }
    } else {
      input = input + value;
      hideinput = false;
      outputsize = 34;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideinput ? " " : input,
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                        fontSize: outputsize,
                        color: Colors.white.withOpacity(0.6)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              button(
                  text: "AC",
                  buttonbgcolor: operatorColor,
                  tcolor: orangeColor),
              button(
                  text: "<", buttonbgcolor: operatorColor, tcolor: orangeColor),
              button(text: "", buttonbgcolor: Colors.transparent),
              button(
                  text: "/", buttonbgcolor: operatorColor, tcolor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(
                  text: "x", buttonbgcolor: operatorColor, tcolor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(
                  text: "-", buttonbgcolor: operatorColor, tcolor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(
                  text: "+", buttonbgcolor: operatorColor, tcolor: orangeColor),
            ],
          ),
          Row(
            children: [
              button(
                  text: "%", buttonbgcolor: operatorColor, tcolor: orangeColor),
              button(text: "0"),
              button(
                text: ".",
              ),
              button(text: "=", buttonbgcolor: orangeColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, tcolor = Colors.white, buttonbgcolor = buttonColor}) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  primary: buttonbgcolor,
                  padding: const EdgeInsets.all(22)),
              onPressed: () => buttononclick(text),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 18, color: tcolor, fontWeight: FontWeight.bold),
              ))),
    );
  }
}
