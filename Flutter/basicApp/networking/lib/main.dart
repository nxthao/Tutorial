import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const url = "https://jsonplaceholder.typicode.com/";

class Album {
  final int userID;
  final int id;
  final String title;

  Album({this.userID, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(userID: json['userId'], id: json['id'], title: json['title']);
  }
}

class FetchAlbum {
  String getPath() {
    return url + "albums/1";
  }

  Future<Album> getAlbum() async {
    final res = await http.get(getPath());

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      return Album.fromJson(json);
    } else {
      throw Exception("Failed to load Album.");
    }
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = FetchAlbum().getAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thao Nguyen: Networking'),
      ),
      body: Center(
        child: _albumData(futureAlbum),
      ),
    );
  }
}

FutureBuilder _albumData(futureAlbum) {
  return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("${snapshot.data.userID}");
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      });
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Thao Nguyen",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
// Text _album(data) {}
