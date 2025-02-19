import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(RandomNumberApp());
}

class RandomNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomNumberScreen(),
    );
  }
}

class RandomNumberScreen extends StatefulWidget {
  @override
  _RandomNumberScreenState createState() => _RandomNumberScreenState();
}

class _RandomNumberScreenState extends State<RandomNumberScreen> {
  int _randomNumber = 0;

  void _generateRandomNumber() {
    setState(() {
      _randomNumber = Random().nextInt(100) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorteio de Número'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Número Sorteado:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '$_randomNumber',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateRandomNumber,
              child: Text('Sortear Número'),
            ),
          ],
        ),
      ),
    );
  }
}
