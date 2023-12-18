import 'package:calculatorapp/homepage.dart';
import 'package:flutter/material.dart';
void main (){
  runApp(calculator());
}
class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner:false,
        home: homepage());
  }
}

