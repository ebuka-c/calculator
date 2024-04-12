import 'package:flutter/material.dart';

class Calcualtor extends StatefulWidget {
  const Calcualtor({Key? key}) : super(key: key);

  @override
  State<Calcualtor> createState() => _CalcualtorState();
}

class _CalcualtorState extends State<Calcualtor> {
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
      firstNum = int.parse(text); //study .parse()
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

  Widget numButton(String btnText, Color? btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        calculate(btnText);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(70, 70),
        backgroundColor: btnColor,
        shape: const CircleBorder(),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          btnText,
          style: TextStyle(fontSize: 25, color: txtColor),
        ),
      ),
    );
  }

  //ui
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Text('Calculator'),
              backgroundColor: Colors.transparent,
              elevation: 5,
              centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        text,
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 80),
                      ),
                    )
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numButton('C', Colors.grey, Colors.black),
                      numButton('+/-', Colors.grey, Colors.black),
                      numButton('%', Colors.grey, Colors.black),
                      numButton('/', Colors.orange, Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numButton('7', Colors.grey[850], Colors.white),
                      numButton('8', Colors.grey[850], Colors.white),
                      numButton('9', Colors.grey[850], Colors.white),
                      numButton('x', Colors.orange, Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numButton('4', Colors.grey[850], Colors.white),
                      numButton('5', Colors.grey[850], Colors.white),
                      numButton('6', Colors.grey[850], Colors.white),
                      numButton('-', Colors.orange, Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numButton('1', Colors.grey[850], Colors.white),
                      numButton('2', Colors.grey[850], Colors.white),
                      numButton('3', Colors.grey[850], Colors.white),
                      numButton('+', Colors.orange, Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.grey[850]),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 52, 0),
                            child:
                                numButton('0', Colors.grey[850], Colors.white),
                          ),
                        ),
                        numButton('.', Colors.grey[850], Colors.white),
                        numButton('=', Colors.orange, Colors.white)
                      ]),
                  const SizedBox(height: 10)
                ]))));
  }
}
