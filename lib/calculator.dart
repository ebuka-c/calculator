import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Calcualtor extends StatefulWidget {
  const Calcualtor({Key? key}) : super(key: key);

  @override
  State<Calcualtor> createState() => _CalcualtorState();
}

class _CalcualtorState extends State<Calcualtor> {
  Widget NumButton(String btnText, Color? btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        calculate(btnText);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: btnColor,
      ),
      child: Text(
        btnText,
        style: TextStyle(fontSize: 25, color: txtColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 80),
              ),
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumButton('C', Colors.grey, Colors.black),
              NumButton('+/-', Colors.grey, Colors.black),
              NumButton('%', Colors.grey, Colors.black),
              NumButton('/', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumButton('7', Colors.grey[850], Colors.white),
              NumButton('8', Colors.grey[850], Colors.white),
              NumButton('9', Colors.grey[850], Colors.white),
              NumButton('x', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumButton('4', Colors.grey[850], Colors.white),
              NumButton('5', Colors.grey[850], Colors.white),
              NumButton('6', Colors.grey[850], Colors.white),
              NumButton('-', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumButton('1', Colors.grey[850], Colors.white),
              NumButton('2', Colors.grey[850], Colors.white),
              NumButton('3', Colors.grey[850], Colors.white),
              NumButton('+', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 52, 0),
                  child: NumButton('0', Colors.grey[850], Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: Colors.grey[850]),
              ),
              NumButton('.', Colors.grey[850], Colors.white),
              NumButton('=', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
        ]),
      ),
    );
  }

  //logic
  int firstNum = 0;
  int secondNum = 0;
  String result = '';
  String text = '';
  String operation = '';

  void calculate(String btnText) {
    if (btnText == 'C') {
      result = '';
      text = '';
      firstNum = 0;
      secondNum = 0;
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/') {
      firstNum = int.parse(text);
      result = '';
      operation = btnText;
    } else if (btnText == '=') {
      secondNum = int.parse(text);
      if (operation == '+') {
        result = (firstNum + secondNum).toString();
      }
      if (operation == '-') {
        result = (firstNum - secondNum).toString();
      }
      if (operation == 'x') {
        result = (firstNum * secondNum).toString();
      }
      if (operation == '/') {
        result = (firstNum / secondNum).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }
}
