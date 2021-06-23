import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterBloc(), child: const MyApp1());
  }
}

class MyApp1 extends StatelessWidget {
  const MyApp1();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DemoPage(),
    );
  }
}

enum CounterEvent {
  increment,
  decrement
}

class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event){
      case CounterEvent.increment:
        // state' is a getter defined inside Bloc<E,S> which // represents the current state of the bloc
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}

class DemoPage extends StatelessWidget{
  const DemoPage();

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: Center(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () => counterBloc.add(CounterEvent.increment),
          child: Text("+1", style: TextStyle(color: Colors.green, fontSize: 25),)),
        BlocBuilder<CounterBloc, int>(
          builder: (context, count) => Text("$count", style: const TextStyle(fontSize: 30),),
        ),
        TextButton(onPressed: () => counterBloc.add(CounterEvent.decrement), child: Text("-1", style: TextStyle(color: Colors.red, fontSize: 25), )),

          ],),),
    );
  }
}