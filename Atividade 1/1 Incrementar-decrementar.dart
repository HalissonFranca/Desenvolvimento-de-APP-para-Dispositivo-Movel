import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Flutter Example App'),
      debugShowCheckedModeBanner: false,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++; //incrementar
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--; //decrementar
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
            const Text(
              'Você precionou',
            ),
            Text(
              '$_counter', 
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              'vezes',
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),

    FloatingActionButton(
      onPressed: _decrementCounter,
      tooltip: 'Decrement',
      child: const Icon(Icons.remove),
    ),
  ],
),

    );
  }
}
