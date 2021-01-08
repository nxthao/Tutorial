import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({this.title});

  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), tooltip: "Menu", onPressed: null),
          Expanded(child: title),
          IconButton(
              icon: Icon(Icons.search), tooltip: "search", onPressed: null),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyApp(
            title: Text(
              "Thao Nguyen",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded(
            child: Center(
              child: Text("Hello the World from Thao Nguyen developer"),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: "First app",
    home: SafeArea(child: MyScaffold()),
  ));
}
