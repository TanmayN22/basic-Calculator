import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatelessWidget {
  const CalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String input = '';
  double result = 0;
  String operator = '';
  final TextEditingController _controller = TextEditingController();

  void _handleNumber(String number) {
    setState(() {
      input += number;
      _controller.text = input;
    });
  }

  void _handleOperator(String newOperator) {
    setState(() {
      if (input.isNotEmpty) {
        result = double.parse(input);
        input = '';
        operator = newOperator;
        _controller.text = '';
      }
    });
  }

  void _calculateResult() {
    setState(() {
      if (input.isNotEmpty && operator.isNotEmpty) {
        double currentInput = double.parse(input);
        switch (operator) {
          case '+':
            result += currentInput;
            break;
          case '-':
            result -= currentInput;
            break;
          case '*':
            result *= currentInput;
            break;
          case '÷':
            result = currentInput != 0 ? result / currentInput : 0;
            break;
        }
        input = result.toString();
        _controller.text = input;
        operator = ''; // Reset operator for next calculation
      }
    });
  }

  void _clearAll() {
    setState(() {
      input = '';
      result = 0;
      operator = '';
      _controller.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 40, 8, 16),
                child: TextField(
                  controller: _controller,
                  readOnly: true,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 32),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => _handleOperator('+'),
                      icon: const Icon(Icons.add, size: 50),
                    ),
                    IconButton(
                      onPressed: () => _handleOperator('-'),
                      icon: const Icon(CupertinoIcons.minus, size: 50),
                    ),
                    IconButton(
                      onPressed: () => _handleOperator('÷'),
                      icon: const Icon(CupertinoIcons.divide, size: 50),
                    ),
                    IconButton(
                      onPressed: () => _handleOperator('*'),
                      icon: const Icon(CupertinoIcons.multiply, size: 50),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                children: [
                  TextButton(
                    onPressed: () => _handleNumber('1'),
                    child: const Text('1', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: () => _handleNumber('2'),
                    child: const Text('2', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: () => _handleNumber('3'),
                    child: const Text('3', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: () => _handleNumber('4'),
                    child: const Text('4', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: () => _handleNumber('5'),
                    child: const Text('5', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: () => _handleNumber('6'),
                    child: const Text('6', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: () => _handleNumber('7'),
                    child: const Text('7', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: () => _handleNumber('8'),
                    child: const Text('8', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: () => _handleNumber('9'),
                    child: const Text('9', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: () => _handleNumber('0'),
                    child: const Text('0', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: _clearAll,
                    child: const Text('C', style: TextStyle(fontSize: 24)),
                  ),
                  TextButton(
                    onPressed: _calculateResult,
                    child: const Text('=', style: TextStyle(fontSize: 24)),
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
