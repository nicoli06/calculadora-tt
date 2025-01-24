import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _currentValue = "0";
  double _num1 = 0;
  double _num2 = 0;
  String _operation = "";

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "0";
        _currentValue = "0";
        _num1 = 0;
        _num2 = 0;
        _operation = "";
      } else if (value == "+" || value == "-" || value == "*" || value == "/") {
        _num1 = double.parse(_currentValue);
        _operation = value;
        _currentValue = "0";
      } else if (value == "=") {
        _num2 = double.parse(_currentValue);
        switch (_operation) {
          case "+":
            _currentValue = (_num1 + _num2).toString();
            break;
          case "-":
            _currentValue = (_num1 - _num2).toString();
            break;
          case "*":
            _currentValue = (_num1 * _num2).toString();
            break;
          case "/":
            _currentValue = (_num1 / _num2).toString();
            break;
        }
        _operation = "";
        _output = _currentValue;
      } else {
        if (value == "." && _currentValue.contains(".")) {
          return;
        }
        _currentValue = _currentValue == "0" ? value : _currentValue + value;
        _output = _currentValue;
      }
    });
  }

  Widget _buildButton(String value) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
        ),
        child: Text(value, style: TextStyle(fontSize: 20.0)),
        onPressed: () => _buttonPressed(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Container(
        color: Colors.lightBlue[100], // Cor de fundo azul clara
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: Text(_output, style: TextStyle(fontSize: 48.0)),
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      _buildButton("7"),
                      _buildButton("8"),
                      _buildButton("9"),
                      _buildButton("/"),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton("4"),
                      _buildButton("5"),
                      _buildButton("6"),
                      _buildButton("*"),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton("1"),
                      _buildButton("2"),
                      _buildButton("3"),
                      _buildButton("-"),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton("C"),
                      _buildButton("0"),
                      _buildButton("."),
                      _buildButton("="),
                      _buildButton("+"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
