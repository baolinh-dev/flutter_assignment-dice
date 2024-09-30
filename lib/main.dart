import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dice Roller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _diceValue = 1;

  void _rollDice() {
    setState(() {
      _diceValue = Random().nextInt(6) + 1; // Generates a random value between 1 and 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            Text(
              'Sinh viên thực hiện: Tran Bao Linh',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Bạn đã ném xúc xắc và nhận được:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            // Display the dice image based on the rolled value
            Image.asset(
              'assets/images/dice$_diceValue.png',
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rollDice,
              child: const Text('Ném xúc xắc'),
            ),
          ],
        ),
      ),
    );
  }
}
