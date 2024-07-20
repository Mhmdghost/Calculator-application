import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculator",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
          backgroundColor: const Color.fromARGB(255, 14, 3, 25),
          centerTitle: true,
        ),
        body:
        
         Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String first = "";
  String second = "";
  String op = "";
  String result = "";

  void _setNumber(String number) {
    setState(() {
      if (op.isEmpty) {
        if (number == "." && first.contains(".")) return;
        first += number;
      } else {
        if (number == "." && second.contains(".")) return;
        second += number;
      }
    });
  }

  void _setOperator(String operator) {
    setState(() {
      if (op.isEmpty) {
        op = operator;
      } else {
        _calculate();
        op = operator;
        second = "";
      }
    });
  }

  void _calculate() {
    setState(() {
      double firstNum = double.parse(first);
      double secondNum = double.parse(second);

      if (op == "+") {
        result = (firstNum + secondNum).toString();
      } else if (op == "-") {
        result = (firstNum - secondNum).toString();
      } else if (op == "*") {
        result = (firstNum * secondNum).toString();
      } else if (op == "/") {
        result = (firstNum / secondNum).toString();
      }
      first = result;
      second = "";
      op = "";
    });
  }

  void _clear() {
    setState(() {
      first = "";
      second = "";
      op = "";
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color:  Color.fromARGB(255, 7, 0, 30),
            child: Center(
              child: Text(
                "$first $op $second  ",
                style: const TextStyle(fontSize: 50,color: Color.fromARGB(255, 240, 240, 240)),
              ),
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 14, 3, 25),
          height: 400,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => _setNumber("1"),
                    child: Text("1", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      minimumSize: const Size(50, 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _setNumber("4"),
                    child: Text("4", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize: const Size(50, 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _setNumber("7"),
                    child: const Text("7", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize:const  Size(50, 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _clear,
                    child: const Text("C", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize: const Size(50, 50),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => _setNumber("2"),
                    child: const Text("2", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize: const Size(50, 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _setNumber("5"),
                    child: Text("5", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize: const Size(50, 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _setNumber("8"),
                    child: Text("8", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape:const  CircleBorder(),
                      minimumSize:const  Size(50, 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _setNumber("0"),
                    child: Text("0", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize: const Size(50, 50),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => _setNumber("3"),
                    child: const Text("3", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize:const  Size(50, 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _setNumber("6"),
                    child: Text("6", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize: const Size(50, 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _setNumber("9"),
                    child: Text("9", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      minimumSize: Size(50, 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _setNumber("."),
                    child: Text(".", style: TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      minimumSize: Size(50, 50),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    
                    onPressed: () => _setOperator("+"),
                    child: Icon(Icons.add, size: 40),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      minimumSize: Size(50, 50),
                      backgroundColor: Colors.black12,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _setOperator("-"),
                    child: Icon(Icons.remove, size: 40),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      minimumSize: Size(50, 50),
                      backgroundColor: Colors.black12,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _setOperator("*"),
                    child: Icon(Icons.clear, size: 40),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      minimumSize: Size(50, 50),
                      backgroundColor: Colors.black12,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _calculate,
                    child: Icon(Icons.equalizer, size: 40), // Updated equal icon
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      minimumSize: Size(50, 50),
                      backgroundColor: Colors.black12,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
