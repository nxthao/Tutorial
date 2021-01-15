import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    title: "Thao Nguyen",
    home: MainApp(
      todos: List<Todo>.generate(
        20,
        (index) => Todo('Todo $index', 'Show the list I need to do'),
      ),
    ),
  ));
}

class MainApp extends StatelessWidget {
  final List<Todo> todos;

  MainApp({Key key, @required this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screeen"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index].title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index])),
            );
          },
        );
      }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(todo.description),
      ),
    );
  }
}
