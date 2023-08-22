import 'package:calculator_app/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  var input = '';
  var output = '';
  var operation = '';

  onButtonClick(value) {
    print(value);
    if (value == 'AC') {
      output = '';
      input = '';
    } else if (value == '<') {
      input = input.substring(0, input.length - 1);
    } else if (value == '=') {
      var userInput = input;
      userInput = input.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(userInput);
      var finalValue = exp.evaluate(EvaluationType.REAL, ContextModel());
      output = finalValue.toString();
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //Input & Output part
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(input,
                    style: const TextStyle(color: Colors.white, fontSize: 70)),
                const SizedBox(
                  height: 15,
                ),
                Text(output,
                    style: const TextStyle(color: Colors.white, fontSize: 50)),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )),

          //button part
          Row(
            children: [
              calButton(text: 'AC', tColor: Colors.orange),
              calButton(text: '<', tColor: Colors.orange),
              calButton(text: '', buttonBgColor: Colors.transparent),
              calButton(text: '/')
            ],
          ),
          Row(
            children: [
              calButton(text: '7'),
              calButton(text: '8'),
              calButton(text: '9'),
              calButton(text: 'x'),
            ],
          ),
          Row(
            children: [
              calButton(text: '4'),
              calButton(text: '5'),
              calButton(text: '6'),
              calButton(text: '-'),
            ],
          ),
          Row(
            children: [
              calButton(text: '1'),
              calButton(text: '2'),
              calButton(text: '3'),
              calButton(text: '+'),
            ],
          ),
          Row(
            children: [
              calButton(text: '%'),
              calButton(text: '0'),
              calButton(text: '.'),
              calButton(text: '=', buttonBgColor: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget calButton({text, tColor = Colors.white, buttonBgColor = bottonColor}) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(22),
              backgroundColor: buttonBgColor),
          onPressed: () => onButtonClick(text),
          child: Text(text, style: TextStyle(color: tColor, fontSize: 20))),
    ));
  }
}
