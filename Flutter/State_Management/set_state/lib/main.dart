import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage();

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
    Padding(padding: const EdgeInsets.all(20), child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
            onPressed: _increment,
            child: const Text(
              "+1",
              style: TextStyle(color: Colors.green, fontSize: 25),
            )),
        Text("$_counter", style: const TextStyle(fontSize: 30),),
        TextButton(onPressed: _decrement, child: const Text("-1", style: TextStyle(color: Colors.red, fontSize: 25,)))
      ],
    ),
    );
  }
}
